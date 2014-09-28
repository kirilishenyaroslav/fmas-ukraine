unit uFilterOrderItems;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uFilterOrderItems                                                          *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Диалог параметров фильтрации для выбора пункта(ов) приказа(ов).            *
*                                                                              *
* Copyright  ©  Дата создания: 04.05.07,  Автор: Найдёнов Е.А                  *
*                                                                              *
*******************************************************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, uNeClasses, uNeTypes, StdCtrls, Buttons, ExtCtrls,
  uDateControl, uFControl, uLabeledFControl, uSpravControl, uCharControl,
  uIntControl;

type

  { *** Назначение: реализация ё диалога параметров фильтрации для выбора пункта(ов) приказа(ов) *** }
  TfmFilterOrderItems = class(TForm)
    pnlForButtons: TPanel;
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    grbMainParams: TGroupBox;
    edtPCard: TqFSpravControl;
    edtMainPeriodBeg: TqFDateControl;
    edtMainPeriodEnd: TqFDateControl;
    grbOKParams: TGroupBox;
    grbRegisterParams: TGroupBox;
    lblMainPeriod: TLabel;
    edt1: TqFIntControl;
    Label1: TLabel;
    qFDateControl1: TqFDateControl;
    qFDateControl2: TqFDateControl;
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
  { *** Назначение: реализация абстрактных методов для универсальной работы с параметрами *** }
  TFilterPrtPlanFact = class(TNeSprav)
  private
    { Private declarations }
  public
    procedure Show; override;
  end;

  function CreateSprav: TNeSprav;

  exports
      CreateSprav;

implementation

resourcestring

    //Имена входящих параметров модуля

    //Имена исходящих параметров модуля
    sPN_OUT_Id_Order_Item = 'Id_Order_Item';

type

    //Запись для хранения значений входящих параметров
    TRec_InParams = record
      FMode       : Integer;
      FDBHandle   : Integer;
    end; 
    
const

    //Массив атрибутов входящих параметров модуля
    cInFieldDefs: array[0..0] of TRec_FieldDefs = (
      ( FName: sPN_IN_Mode; FType: ftInteger ) );

    //Массив атрибутов исходящих параметров модуля
    cOutFieldDefs: array[0..0] of TRec_FieldDefs = (
      ( FName: sPN_OUT_Id_Order_Item; FType: ftVariant ) );

{$R *.dfm}

function CreateSprav: TNeSprav;
var
    vParams : TRec_Params;
begin
    try 
        vParams.FInParams  := @cInFieldDefs;
        vParams.FOutParams := @cOutFieldDefs;

        Result := TFilterPrtPlanFact.Create( tpInputOutput, vParams );
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;
end;

{ TFilterPrtPlanFact }
procedure TFilterPrtPlanFact.Show;
var
    ModRes       : TModalResult;
    InParams     : TRec_InParams;
    fmFltrParams : TfmFilterOrderItems;
begin
    try
        inherited;
        //Запоминаем значения входящих параметров

        try
            //Создаем экземпляр специального класса
            fmFltrParams := TfmFilterOrderItems.Create( Application.MainForm );

            //Отображаем фильтрационную форму
            ModRes := fmFltrParams.ShowModal;

            if ModRes = mrOK
            then begin
            end;
            
        finally
            if fmFltrParams <> nil then FreeAndNil( fmFltrParams );
        end;
    except
        on E: Exception
        do begin
            MessageBox( 0, PChar( sErrorTextExtUA + E.Message ), PChar( sMsgCaptionErrUA ), MB_OK or MB_ICONERROR );
        end;
    end;

end;

end.
