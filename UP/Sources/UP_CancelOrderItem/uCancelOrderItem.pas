unit uCancelOrderItem;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uCancelOrderItem                                                           *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Диалог добавления/изменения/просмотра пункта приказа, отменяющего дествие  *
*   другого пункта приказа.                                                    *
*                                                                              *
* Copyright  ©  Дата создания: 24.11.06,  Автор: Найдёнов Е.А                  *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, FIBQuery, pFIBQuery, pFIBStoredProc, DB, FIBDataSet,
  pFIBDataSet, FIBDatabase, pFIBDatabase, IBase, StdCtrls, Buttons, uFormControl,
  ExtCtrls, uCharControl, uFControl, uLabeledFControl, uSpravControl, uCommonSp,
  uInvisControl;

type
   
  //Запись для хранения атрибутов полей
  TRec_FieldDefs = record
      FName : String;
      FType : TFieldType;
  end; 
   
  //Запись хранит реквизиты для ведения истории изменений
  TRec_HistoryInfo = record
      FIdSession  : Int64;
      FCodeSystem : Integer;
  end; 
  
  { *** Назначение: реализация абстрактных методов для универсальной работы с параметрами  *** }
  TCancelOrderItem = class(TSprav)
  private
      procedure SetFieldDefs;
  public
      constructor Create; reintroduce;
      function GetFrame: TFrame; override;
  end;

  { *** Назначение: реализация диалога добавления/изменения/просмотра пункта приказа, отменяющего дествие другого пункта приказа *** }
  TfrCancelOrderItem = class(TFrame)

    pnlForButtons    : TPanel;
    gbxOrderItemAttr : TGroupBox;
    
    fmcWork          : TqFFormControl;
    edtNote          : TqFCharControl;
    edtItem          : TqFSpravControl;
    edtReason        : TqFCharControl;

    btnOK            : TBitBtn;
    btnCancel        : TBitBtn;

    dbWork           : TpFIBDatabase;
    dstWork          : TpFIBDataSet;
    spcWork          : TpFIBStoredProc;

    trRead           : TpFIBTransaction;
    trWrite          : TpFIBTransaction;

    edtIdOrder       : TqFInvisControl;
    edtNumItem       : TqFInvisControl;
    edtKeySession    : TqFInvisControl;
    edtNumSubItem    : TqFInvisControl;
    edtIdOrderItem   : TqFInvisControl;
    edtIdOrderType   : TqFInvisControl;
    
    procedure btnOKClick                 (Sender: TObject);
    procedure btnCancelClick             (Sender: TObject);
    procedure edtItemOpenSprav           (Sender: TObject; var Value: Variant; var DisplayText: String);
    procedure fmcWorkDatabaseEventAfter  (Sender: TObject; Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
    procedure fmcWorkDatabaseEventBefore (Sender: TObject; Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
    
  private
    FOuterHWND   : Integer;
    FHistoryInfo : TRec_HistoryInfo;

    function  GetOuterHWND   : Integer;
    function  GetHistoryInfo : TRec_HistoryInfo;
    procedure SetOuterHWND   ( aValue: Integer );
    procedure SetHistoryInfo ( aValue: TRec_HistoryInfo );
  public
    property pOuterHWND   : Integer          read GetOuterHWND   write SetOuterHWND;
    property pHistoryInfo : TRec_HistoryInfo read GetHistoryInfo write SetHistoryInfo;
  end;

  function CreateSprav: TSprav; stdcall;

  exports
      CreateSprav;
      
implementation

uses UpKernelUnit, AppStruClasses;
    
resourcestring

    {***************************************}
    {   *** Ресурсы общего назначения ***   }
    {***************************************}

	//Составляющие сообщения об ошибке
	sErrorTextUA    = '       Помилка: ';
	sErrorCodeUA    = 'Код помилки: ';
	sErrorAddrUA    = 'Адреса помилки: ';
	sContinueQstUA  = ' Продовжити?';
	sErrorTextExtUA = 'Помилка: ';

	sMsgCaptionErrUA = 'Помилка';
	sMsgCaptionWrnUA = 'Попередження';
	sMsgCaptionInfUA = 'Інформація';
	sMsgCaptionQstUA = 'Підтвердження';

	sErr_KernelError        = 'Неможливо відмінити пункт наказу!'#13'Показати перелік невідповідностей?';
	sErr_DBConnectionFailed = 'З''єднання з базою даних неможливе!'#13'перевірте, будь ласка, вхідні параметри';

    //Имена входящих параметров

    //Основные
    sPN_Mode          = 'Mode';
    sPN_Id_Order      = 'Id_Order';
    sPN_Num_Item      = 'Num_Item';
    sPN_DBHandle      = 'DBHandle';
    sPN_Outer_Hwnd    = 'Outer_Hwnd';
    sPN_Num_Sub_Item  = 'Num_Sub_Item';
    sPN_Id_Order_Item = 'Id_Item';
    sPN_Id_Order_Type = 'Id_Order_Type';
    //Дополнительные
    sPN_Code_System = 'Code_System';

    //Названия полей
    sFN_ID_SESSION = 'ID_SESSION';

    //Названия параметров ХП
    sPPN_ID_SESSION    = 'IN_KEY_SESSION';
    sPPN_ID_ORDER_ITEM = 'IN_ID_ORDER_ITEM';

    //Пути к файлам внешних модулей
    sPTH_SP_OrderItems    = 'UP\UP_SpOrderItems70.bpl'; 
    sPTH_FilterOrderItems = 'UP\UP_FilterOrderItems70.bpl'; 

    //Названия ХП
    sSPN_UP_DT_CANCEL_BUFF_DEL      = 'UP_DT_CANCEL_BUFF_DEL';
    sSPN_UP_DT_ORDER_ITEMS_BUFF_DEL = 'UP_DT_ORDER_ITEMS_BUFF_DEL';

    //SQL-запросы
    sSQL_SEL_GetKeySession = 'SELECT U.ID_SESSION FROM UP_GET_ID_SESSION U'; 

const

	{*****************************************}
    {   *** Константы общего назначения ***   }
    {*****************************************}

    cZERO                = 0;
    cTICK                = '''';
    cCOMMA               = ',';
    cBRACKET_OPEN        = '(';
    cBRACKET_CLOSE       = ')'; 
    cDEF_ID_SESSION      = -1;
    cDEF_CODE_SYSTEM     = 10;
    cDEF_KEY_FIELD_NAMES = '';

    cFieldDefs: array[0..7] of TRec_FieldDefs = (
      ( FName: sPN_Mode;          FType: ftInteger ),
      ( FName: sPN_Id_Order;      FType: ftVariant ),
      ( FName: sPN_Id_Order_Item; FType: ftVariant ),
      ( FName: sPN_Id_Order_Type; FType: ftVariant ),
      ( FName: sPN_Num_Item;      FType: ftInteger ),
      ( FName: sPN_Num_Sub_Item;  FType: ftInteger ),
      ( FName: sPN_Outer_Hwnd;    FType: ftInteger ),
      ( FName: sPN_Code_System;   FType: ftInteger ) );

{$R *.dfm}

function TfrCancelOrderItem.GetOuterHWND: Integer;
begin
  Result := FOuterHWND;
end;

function TfrCancelOrderItem.GetHistoryInfo: TRec_HistoryInfo;
begin
  Result := FHistoryInfo;
end;

procedure TfrCancelOrderItem.SetOuterHWND(aValue: Integer);
begin
  FOuterHWND := aValue;
end;

procedure TfrCancelOrderItem.SetHistoryInfo(aValue: TRec_HistoryInfo);
begin
  FHistoryInfo := aValue;
end;

function CreateSprav: TSprav;
begin
    Result := TCancelOrderItem.Create;
end;

{ TCancelOrderItem }
procedure TCancelOrderItem.SetFieldDefs;
var
    i, n : Integer;
begin
    n := High( cFieldDefs );
    
    for i := Low( cFieldDefs ) to n
    do 
        with cFieldDefs[i]
        do begin
            Input.FieldDefs.Add( FName, FType );
        end;
end;

//Создаем экземпляр класса
constructor TCancelOrderItem.Create;
begin
    try
        inherited Create;
        SetFieldDefs;
        PrepareMemoryDataSets;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Возвращаем проинициализированный экземпляр класса
function TCancelOrderItem.GetFrame: TFrame;
begin
    try
        if Input[sPN_DBHandle] <> 0
        then begin
            //Создаем фрейм и инициализируем компоненты
            Result := TfrCancelOrderItem.Create( Application.MainForm );

            with Result as TfrCancelOrderItem
            do begin
                //Возвращаем дескрипторы кнопок управляющему окну
                SendMessage( Input[sPN_Outer_Hwnd], FMAS_MESS_GET_BUTTON_OK,     btnOK.Handle,     btnOK.Handle     );
                SendMessage( Input[sPN_Outer_Hwnd], FMAS_MESS_GET_BUTTON_CANCEL, btnCancel.Handle, btnCancel.Handle );
                
                dbWork.Handle := TISC_DB_Handle( Integer( Input[sPN_DBHandle] ) );
                trRead.StartTransaction;
                fmcWork.Prepare( dbWork, TFormMode( Input[sPN_Mode] ), Input[sPN_Id_Order_Item], Input[sPN_Id_Order] );
                
                //Сохраняем значения основных входящих параметров
                pOuterHWND           := Input[sPN_Outer_Hwnd   ];
                edtIdOrder.Value     := Input[sPN_Id_Order     ];
                edtNumItem.Value     := Input[sPN_Num_Item     ];
                edtNumSubItem.Value  := Input[sPN_Num_Sub_Item ];
                edtIdOrderItem.Value := Input[sPN_Id_Order_Item];
                edtIdOrderType.Value := Input[sPN_Id_Order_Type];

                //Сохраняем значения дополнительных входящих параметров
                with pHistoryInfo
                do begin
                    FIdSession := cDEF_ID_SESSION;

                    if VarIsNull( Input[sPN_Code_System] )
                    then begin
                        FCodeSystem := cDEF_CODE_SYSTEM;
                    end
                    else begin
                        FCodeSystem := Input[sPN_Code_System];
                    end;
                end;
                
            end;

        end
        else begin
            MessageBox( 0, PChar( sErr_DBConnectionFailed ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Пишем реквизиты пункта приказа в буфер
procedure TfrCancelOrderItem.btnOKClick(Sender: TObject);
begin
    try
        //Получаем идентификатор сессии работы с ядром
        if ( fmcWork.Mode in [fmAdd, fmModify] )
        then begin
            if dstWork.Active then dstWork.Close;
            dstWork.SQLs.SelectSQL.Text := sSQL_SEL_GetKeySession;    
            try
                dstWork.Prepare;
                dstWork.Open;
                edtKeySession.Value := dstWork.FBN( sFN_ID_SESSION ).Value;
            finally
                dstWork.Close;
            end;
        end;
        
        //Выполнение соответствующего SQL-запроса в зависимости от режима вызова модуля
        fmcWork.Ok;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Ведение историии изменений
procedure TfrCancelOrderItem.fmcWorkDatabaseEventBefore(Sender: TObject;
  Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
begin
    try 
        //Проверяем необходимость ведения протокола изменений
        if ( fmcWork.Mode = fmModify )
        then begin

            with pHistoryInfo
            do begin
                //Вызываем ф-цию ядра для ведения протокола изменений
                StartHistory( TpFIBTransaction( Transaction ), FCodeSystem, FIdSession );
            end;
            
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Вызов ядра УП
procedure TfrCancelOrderItem.fmcWorkDatabaseEventAfter(Sender: TObject;
  Form: TForm; Mode: TFormMode; Transaction: TFIBTransaction);
var
    DlgResult      : Integer;
    IdOrderItem    : Int64;
    KernelResult   : Boolean;
    Ptr_KernelInfo : PUP_KERNEL_MODE_STRUCTURE;
begin
    try
        if ( fmcWork.Mode in [fmAdd, fmModify] )
        then begin
            try
                //Получаем идентификатор пункта приказа
                case fmcWork.Mode of

                  fmAdd    : begin
                               IdOrderItem := fmcWork.LastId;
                             end;

                  fmModify : begin
                               IdOrderItem := edtIdOrderItem.Value;
                             end;
                end;
                
                //Выделяем память для указателя на структуру ядра УП
                New( Ptr_KernelInfo );
            
                //Заполняем структуру данными
                with Ptr_KernelInfo^
                do begin
                    AOWNER           := Self;
                    DBHANDLE         := dbWork.Handle;
                    TRHANDLE         := Transaction.Handle;
                    ID_ORDER         := edtIdOrder.Value;
                    KEY_SESSION      := edtKeySession.Value;
                    ID_ORDER_ITEM_IN := IdOrderItem;
                end;

                //Вызываем ядро
                KernelResult := UpKernelDo( Ptr_KernelInfo );

                //Анализируем результат работы ядра
                if KernelResult
                then begin
                    if Transaction.InTransaction then Transaction.Commit;
                    SendMessage( pOuterHWND, FMAS_MESS_SAVE_ITEM_OK, 0, 0 );
                end
                else begin
                    SendMessage( pOuterHWND, FMAS_MESS_SAVE_ITEM_ERR, 0, 0 );
                    DlgResult := MessageBox( 0, PChar( sErr_KernelError ), PChar( sMsgCaptionWrnUA ), MB_OKCANCEL or MB_ICONWARNING );
                    
                    if DlgResult = ID_OK
                    then begin
                        GetUpSessionErrors( Self, dbWork.Handle, edtKeySession.Value, IdOrderItem );
                    end;
                end;

                //Очищаем буфера
                if trWrite.InTransaction then trWrite.Commit;
                spcWork.StoredProcName := sSPN_UP_DT_CANCEL_BUFF_DEL;
                spcWork.ParamByName( sPPN_ID_SESSION ).AsInt64 := edtKeySession.Value;

                try
                    trWrite.StartTransaction;
                    spcWork.Prepare;
                    spcWork.ExecProc;

                    spcWork.StoredProcName := sSPN_UP_DT_ORDER_ITEMS_BUFF_DEL;
                    spcWork.ParamByName( sPPN_ID_SESSION    ).AsInt64 := edtKeySession.Value;
                    spcWork.ParamByName( sPPN_ID_ORDER_ITEM ).AsInt64 := fmcWork.LastId;
                    spcWork.Prepare;
                    spcWork.ExecProc;
                finally
                    trWrite.Commit;
                    spcWork.Close; 
                end;

            finally
                //Освобождаем ресурсы
                if ( Ptr_KernelInfo <> nil )
                then begin
                    Dispose( Ptr_KernelInfo );
                    Ptr_KernelInfo := nil;
                end;
            end;
        end
        else begin
            //Закрываем фрейм в режиме просмотра
            if ( fmcWork.Mode = fmInfo )
            then begin
                btnCancel.Click;
            end;
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Закрываем фрейм
procedure TfrCancelOrderItem.btnCancelClick(Sender: TObject);
begin
    try
        SendMessage( pOuterHWND, FMAS_MESS_CLOSE_FRAME, 0, 0 );
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

//Вызываем справочник пунктов приказов
procedure TfrCancelOrderItem.edtItemOpenSprav( Sender: TObject; var Value: Variant; var DisplayText: String);
{var
     FilterOrderItems : TSprav;
}begin
{    try
        try
            //Cоздаем фильтр для справочника
            SpOrderItems := GetSprav( sPTH_FilterOrderItems );

              if FilterOrderItems <> nil
              then begin
                  //Заполняем входящие параметры фильтра
                  with FilterOrderItems
                  do begin
                      Input.Append;
                      Input.FieldValues[sPN_IN_SP_PCARD_DBHandle] := FInParams.FDBHandle;
                      Input.Post;

                      //Показываем фильтр
                      Show;

                      //Анализируем результат
                      if ( Output <> nil ) AND not Output.IsEmpty
                      then begin
                          Value       := Output[sPN_OUT_SP_PCARD_ID_PCARD];
                          DisplayText := Output[sPN_OUT_SP_PCARD_FIO     ];
                      end;
                  end;
              end
              else begin
                  MessageBox( Handle, PChar( sErr_SpravNotFound + sErr_SpPCardListNotFound ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
              end;
                 
        finally
            if FilterOrderItems <> nil then FreeAndNil( FilterOrderItems );
        end;
    except
        on E: Exception
        do begin
            MessageBox( Handle, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
}end;

end.

