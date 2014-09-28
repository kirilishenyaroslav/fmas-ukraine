unit uneUtils;

{*******************************************************************************
*                                                                              *
* Название модуля :                                                            *
*                                                                              *
*	uneUtils                                                                   *
*                                                                              *
* Назначение модуля :                                                          *
*                                                                              *
*	Централизованное хранение используемых в приложении процедур и функций.    *
*                                                                              *
* Copyright  ©  Год 2005,  Автор: Найдёнов Е.А                                 *
*                                                                              *
*******************************************************************************}

interface

uses
	SysUtils, Classes, Windows, Forms, Dialogs, Controls, StdCtrls, IniFiles, Variants, cxGridDBTableView,
    cxGridDBDataDefinitions, pFIBDataSet, Halcn6db, DB, DateUtils, uneTypes;

	procedure SetFormPos        ( const aOwner: TForm; var aForm: TForm );
	procedure SetFirstZero      ( var aDigit: String );
//    procedure GetDateInv        ( aDataSet: TpFIBDataSet; const aDateBeg, aDateEnd: TDate; const aDateCount: TCheckedBoxes );
//    procedure GetSetUpInfo      ( aDataSet: TpFIBDataSet; const aSetUpInfo: PSetUp );
	procedure LogException      ( const aFileName: TFileName );
	procedure FreeAndNilPTR     ( var aPointer: Pointer; const aPTRIsUntyped: Boolean = False );

//    function GetValue           ( const aStruct: TSection; const aValueName: String ): Variant;
	function SortArray          ( var aArray: TIntArray ): Boolean;
	function ReadRecId          ( const aDataContr: TcxGridDBDataController; const aKeyColumnIndex, aMultiColumnIndex: Integer; const aSelectedRecCount: Integer ): TIntArray;
	function WriteRecId         ( const aDataContr: TcxGridDBDataController; const aMultiColumnIndex: Integer; const aIdCheckedRec: TIntArray ): Boolean;
//    function GetSpIndex         ( const aOwner: TForm; const aMenuTag: Integer): Integer;
//    function IsDateValid        ( const aDateBeg, aDateEnd: String; const aDateCount: TCheckedBoxes ): Boolean ;
//    function ReadIniFile        ( var aIniFile: TIniFileInfo ): Boolean;
	function MessageDlgRus      ( const aCaption: TCaption; const aMsg: String; const aDlgType: TMsgDlgType; const aButtons: TMsgDlgButtons ): word;
	function SelectRecords      ( var aDBTableView: TcxGridDBTableView; const aColumnName: TcxGridDBColumn; const aSelectionKind: TSelectionType ): Integer;
	function GetSelRecCount     ( const aSelRecCount, aTotalRecCont: Integer ): TCheckedRecCount;
	function CheckDBFStructure  ( aSource: THalcyonDataSet; const aDBFFileName: String; aFields: array of TFieldRec; aErrorMsg: array of String; aHWND: HWND ): TImportCheckError;
	function GetCheckedRecCount ( const aDataContr: TcxGridDBDataController; const aMultiColumnIndex: Integer ): Integer;

	function GetMonthName(d : TDateTime) : shortstring;

implementation

procedure LogException ( const aFileName: TFileName );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	LogException                                                               *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Процедура протоколирует ошибки, возникающие в приложении                     *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aFileName - полный путь к файлу протокола.                              *
*                                                                              *
*******************************************************************************}

var
    m       : word;
    Buf     : array[0..511] of char;
    FStream : TFileStream;
begin

    if FileExists( aFileName )
    then
        m := fmOpenReadWrite
    else
        m := fmCreate;

    FStream := TFileStream.Create( aFileName, m );
    FStream.Seek( 0, soFromEnd );

    StrPCopy( Buf, DateTimeToStr(Now)+ '.   ' );
    ExceptionErrorMessage( ExceptObject, ExceptAddr, @Buf[ StrLen(Buf) ], SizeOf(Buf) - StrLen(Buf) );
    StrCat( Buf, #13#10 );

    FStream.WriteBuffer( Buf, StrLen(Buf) );
    FStream.Free;

end;  //End of procedure LogException

//function ReadIniFile( var aIniFile: TIniFileInfo ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	ReadIniFile                                                                *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Организация корректного соединения с базой данных посредством считывания   *
* настроек соединения из INI - файла на жёстком диске.                         *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aIniFile - запись, содержащая информацию о содержимом файла настройки.  *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      aIniFile.                                                               *
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
*	Если соединение установленно, результат возвращаемый функцией - истина,    *
* если нет - ложь.                                                             *
*                                                                              *
*******************************************************************************}

{var
    i, j     : Integer;
    IniFile  : TIniFile;
    FileName : String;

begin

  try

    Result   := False;
    IniFile  := nil;

    //Получаем путь + собственно имя файла настройки

	FileName := ExtractFilePath( Application.ExeName ) + cINI_FILE_NAME;

    //Проверяем существование файла настройки

	if FileExists( FileName )
    then begin

      //Связываем файловую переменную с файлом настройки

      IniFile := TIniFile.Create( FileName );

      //Считываем настройки из файла конфигурации

      with aIniFile
      do

        for i := Low( cSECTIONS.Keys ) to High( cSECTIONS.Keys ) do
        begin
          Sections.Keys[i].Name  := cSECTIONS.Keys[i].Name;
          Sections.Keys[i].Value := IniFile.ReadString( cSECTIONS.Name, cSECTIONS.Keys[i].Name, '' );
        end;

      //Освобождаем ресурсы

      IniFile.Free;
      Result := True;

    end
    else
      MessageDlgRus( 'Ошибка', 'Файл настройки не найден', mtWarning, [mbOK] );

  except

    on EIniFileException do
    begin
      Result := False;
      MessageDlg( 'Ошибка обработки INI-файла', mtError, [mbOK], 0 );
    end;

  end;

end;} //End of function ReadIniFile

procedure SetFormPos( const aOwner: TForm; var aForm: TForm );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	SetFormPos                                                                 *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*	Размещает дочернюю форму по центру относительно родительской формы.        *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*       aOwner - родительская форма.                                           *
*       aForm  - дочерняя форма.                                               *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       aForm.                                                                 *
*                                                                              *
* RESULT: Новое положение дочерней формы относительно родительской.            *
*                                                                              *
*******************************************************************************}

begin
  aForm.Left := aOwner.Left + Round( ( aOwner.Width - aForm.Width )/2 );
  aForm.Top  := aOwner.Top + Round( ( aOwner.Height - aForm.Height )/2 );
end; //End of procedure SetFormPos

//function GetValue( const aStruct: TSection; const aValueName: String ): Variant;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetValue                                                                   *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Возвращает значение элемента массива заданной структуры.                   *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aStruct    - структура.                                                 *
*      aValueName - имя элемента структуры.                                    *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
* Result : Variant.                                                            *
*                                                                              *
* RESULT: Значение элемента массива.                                           *
*                                                                              *
*******************************************************************************}

{var
   i : Integer;

begin

  Result := Null;

  for i := Low( aStruct.Keys ) to High( aStruct.Keys ) do

    if aStruct.Keys[i].Name = aValueName
    then begin
      Result := aStruct.Keys[i].Value;
      Break;
    end;

end;} //End of function GetValue

function MessageDlgRus( const aCaption: TCaption; const aMsg: String; const aDlgType: TMsgDlgType; const aButtons: TMsgDlgButtons ): word;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	MessageDlgRus                                                              *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Возвращает результат диалога.                                              *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aCaption - заголовок диалога.                                           *
*      aMsg     - сообщение диалога.                                           *
*      aDlgType - тип диалога.                                                 *
*      aButtons - набор кнопок для диалога.                                    *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      Result : Word.                                                          *
*                                                                              *
* RESULT: Возвращает результат завершения диалога пользователем.               *
*                                                                              *
*******************************************************************************}

var
   i       : Integer;
   MsgForm : TForm;

begin

  if aButtons <> []
  then begin

    MsgForm := CreateMessageDialog( aMsg, aDlgType, aButtons );
    MsgForm.Caption := aCaption;

    for i := 0 to ( MsgForm.ComponentCount - 1 ) do
    begin

      if MsgForm.Components[i] is TButton
      then begin

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = 'OK'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Принять';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = 'CANCEL'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Отменить';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&YES'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Да';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&NO'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Нет';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&ABORT'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Отмена';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&RETRY'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Повтор';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&IGNORE'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Игнорировать';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&ALL'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Всё';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = '&HELP'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Помощь';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = 'N&O TO ALL'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Нет для всех';

        if UpperCase( TButton( MsgForm.Components[i] ).Caption ) = 'YES TO &ALL'
        then
          TButton( MsgForm.Components[i] ).Caption := 'Да для всех';

      end;

    end;

    Result := MsgForm.ShowModal;
    MsgForm.Free;

  end
  else begin
    Result := 0;
  end;

end; //End of Funtion MessageDlgRus

function SelectRecords( var aDBTableView: TcxGridDBTableView; const aColumnName: TcxGridDBColumn; const aSelectionKind: TSelectionType  ): Integer;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	SelectRecords                                                              *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Возвращает количество помеченных пользователем записей, в случае если спра-*
* вочник был вызван в режиме мультивыбора.                                     *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aColumnName    - имя столбца, реализующего функциональность мультивыбора*
*      aDBTableView   - таблица, содержащая вышеуказанный столбец.             *
*      aSelectionKind - тип мультивыбора.                                      *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      Result : Integer.                                                       *
*                                                                              *
* RESULT: Количество помеченных записей.                                       *
*                                                                              *
*******************************************************************************}

var
    i         : Integer;
    CellValue : Variant;

begin

  Result := 0;

  case aSelectionKind of

    stpSelectAll  :  begin
                       aDBTableView.BeginUpdate;

                       for i := 0 to ( aDBTableView.DataController.GetRecordCount - 1 ) do
                       begin
                         aDBTableView.DataController.Values[ i, aColumnName.Index ] := True;
                         Inc( Result );
                       end;

                       aDBTableView.EndUpdate;
                     end;

    stpUnSelectAll:  begin
                       aDBTableView.BeginUpdate;

                       for i := 0 to ( aDBTableView.DataController.GetRecordCount - 1 ) do
                       begin
                         aDBTableView.DataController.Values[ i, aColumnName.Index ] := False;
                       end;

                       aDBTableView.EndUpdate;
                     end;

    stpInvert     :  begin
                       aDBTableView.BeginUpdate;

                       for i := 0 to ( aDBTableView.DataController.GetRecordCount - 1 ) do
                       begin

                         CellValue := aDBTableView.DataController.Values[ i, aColumnName.Index ];

                         if CellValue = Null
                         then
                             CellValue := False
                         else
                             CellValue := Boolean( CellValue );

                         if CellValue
                         then begin
                           aDBTableView.DataController.Values[ i, aColumnName.Index ] := False;
                         end
                         else begin
                           aDBTableView.DataController.Values[ i, aColumnName.Index ] := True;
                           Inc( Result );
                         end;

                       end;

                       aDBTableView.EndUpdate;
                     end;

  end;

end; //End of function SelectRecords

function GetSpIndex( const aOwner: TForm; const aMenuTag: Integer): Integer;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	GetSpIndex                                                                 *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Возвращает индекс дочерней формы из списка дочерних окон родительской формы*
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aOwner   - родительская форма.                                          *
*      aMenuTag - значение свойства Tag пункта меню.                           *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*      Result : Integer.                                                       *
*                                                                              *
* RESULT: Индекс дочерней формы.Если дочерняя форма не найдена, функция воз -  *
*   вращает -1. (Идея: свойство Tag пункта меню, при клике на котором создаётся*
*   экземпляр дочернего окна, должно быть равно значению свойства Tag класса,  *
*   от которого порождён данный экземпляр )                                    *
*                                                                              *
*******************************************************************************}

var
    i: Integer;

begin

   Result := -1;

    for i := 0 to ( aOwner.MDIChildCount - 1 ) do
    begin

        if aOwner.MDIChildren[i].Tag = aMenuTag
        then begin
            Result := i;
            Break;
        end

    end;

end; // End of function GetSpIndex

function ReadRecId( const aDataContr: TcxGridDBDataController; const aKeyColumnIndex, aMultiColumnIndex: Integer; const aSelectedRecCount: Integer ): TIntArray;

{********************************************************************************
*                                                                               *
* Название функции :                                                            *
*                                                                               *
*	ReadRecId                                                                   *
*                                                                               *
* Назначение функции :                                                          *
*                                                                               *
*	Запоминает идентификаторы помеченных записей в массив.                      *
*                                                                               *
* IN:                                                                           *
*                                                                               *
*       aDataContr        - дата контроллер грида.                              *
*       aKeyColumnIndex   - индекс столбца, содержащего значения ключевого поля *
*       aMultiColumnIndex - индекс столбца для мультивыбора.                    *
*       aSelectedRecCount - количество помеченных записей.                      *
*                                                                               *
* OUT:                                                                          *
*                                                                               *
*       Result : TIntArray.                                                     *
*                                                                               *
* RESULT: Массив идентификаторов помеченных записей.                            *
*                                                                               *
********************************************************************************}

var
    i, j      : Integer;
    CellValue : Variant;

begin

    j := 0;
    SetLength( Result, aSelectedRecCount );

    for i := 0 to ( aDataContr.RecordCount - 1 ) do
    begin
      CellValue := aDataContr.Values[ i, aMultiColumnIndex ];

      if CellValue = True
      then begin
        Result[j] := Integer( aDataContr.Values[ i, aKeyColumnIndex ] );
        Inc(j);
      end;

    end;

end; //End of function ReadRecId

function WriteRecId( const aDataContr: TcxGridDBDataController; const aMultiColumnIndex: Integer; const aIdCheckedRec: TIntArray ): Boolean;

{********************************************************************************
*                                                                               *
* Название функции :                                                            *
*                                                                               *
*	WriteRecId                                                                  *
*                                                                               *
* Назначение функции :                                                          *
*                                                                               *
*	Восстанавливает "галочки" для помеченных ранее записей.                     *
*                                                                               *
* IN:                                                                           *
*                                                                               *
*       aDataContr        - дата контроллер грида.                              *
*       aMultiColumnIndex - индекс столбца для мультивыбора.                    *
*       aIdCheckedRec     - массив идентификаторов помеченных записей.          *
*                                                                               *
* OUT:                                                                          *
*                                                                               *
*       Result : Boolean.                                                       *
*                                                                               *
* RESULT: Функция возвращает True, если для ВСЕХ помеченных записей "галочки"   *
*           успешно восстановлены, если же нет, тогда - False.                  *
*                                                                               *
********************************************************************************}

var
    i           : Integer;
    RecordIndex : Integer;

begin

    Result := True;

    for i := 0 to High( aIdCheckedRec ) do
    begin
       RecordIndex := aDataContr.FindRecordIndexByKey( aIdCheckedRec[i] );

       if RecordIndex <> -1
       then
           aDataContr.Values[ RecordIndex, aMultiColumnIndex ] := True
       else
         Result := False;

    end;

end; //End of function WriteRecId

function GetSelRecCount( const aSelRecCount, aTotalRecCont: Integer ): TCheckedRecCount;

{********************************************************************************
*                                                                               *
* Название функции :                                                            *
*                                                                               *
*	GetSelRecCount                                                              *
*                                                                               *
* Назначение функции :                                                          *
*                                                                               *
*	Возвращает значение перечислимого типа, показывающее кол-во помеченных запи-*
*   сей относительно общего кол-ва записей в наборе данных.                     *
*                                                                               *
* IN:                                                                           *
*                                                                               *
*       aSelRecCount  - кол-во помеченных записей.                              *
*       aTotalRecCont - кол-во записей в наборе данных.                         *
*                                                                               *
* OUT:                                                                          *
*                                                                               *
*       Result : TCheckedRecCount.                                              *
*                                                                               *
* RESULT: значение перечислимого типа TCheckedRecCount.                         *
*                                                                               *
********************************************************************************}

begin

  if aSelRecCount = 0
  then
    Result := crcNone
  else
    if aSelRecCount = aTotalRecCont
    then
      Result := crcAll
    else
      Result := crcSome;

end; //End of function GetSelRecCount

function GetCheckedRecCount( const aDataContr: TcxGridDBDataController; const aMultiColumnIndex: Integer ): Integer;

{********************************************************************************
*                                                                               *
* Название функции :                                                            *
*                                                                               *
*	GetCheckedRecCount                                                          *
*                                                                               *
* Назначение функции :                                                          *
*                                                                               *
*	Пересчитывает кол-во помеченных записей.                                    *
*                                                                               *
* IN:                                                                           *
*                                                                               *
*       aDataContr        - дата контроллер грида.                              *
*       aMultiColumnIndex - индекс столбца для мультивыбора.                    *
*                                                                               *
* OUT:                                                                          *
*                                                                               *
*       Result : Integer.                                                       *
*                                                                               *
* RESULT: возвращает кол-во помеченных записей.                                 *
*                                                                               *
********************************************************************************}

var
   i : Integer;

begin

  Result := 0;

  for i := 0 to ( aDataContr.RecordCount - 1 ) do
  begin
    if aDataContr.Values[ i, aMultiColumnIndex ] = True
    then
      Inc( Result );
  end;

end; //End of function GetCheckedRecCount

//procedure GetDateInv( aDataSet: TpFIBDataSet; const aDateBeg, aDateEnd: TDate; const aDateCount: TCheckedBoxes );

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	GetDateInv                                                                 *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*   Процедура возвращает множество дат регистрации налоговых накладных, удовле *
*   творяющих некоторому интервалу времени.                                    *
*	Проверяет корректность значений дат начала и конца интервала времени и,    *
*   если значения не имеют смысла, тогда изменяет их на текущую дату.          *
*                                                                              *
* IN:                                                                          *
*       aDataSet   - набор данных                                              *
*       aDateBeg   - дата начала интервала времени.                            *
*       aDateEnd   - дата конца интервала времени.                             *
*       aDateCount - кол-во используемыж дат.                                  *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       aDataSet                                                               *
*                                                                              *
* RESULT: Новые значения дат регистрации налоговых накладных.                  *
*                                                                              *
*******************************************************************************}

{begin

  case aDateCount of

    cbNone : begin
               aDataSet.Close;
               aDataSet.SQLs.SelectSQL.Clear;
               aDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM NDS_DT_DATES_SEL( Null, Null )ORDER BY DATE_INVOICE DESC';
               aDataSet.Open;
             end;

    cbFrom : begin
               aDataSet.Close;
               aDataSet.SQLs.SelectSQL.Clear;
               aDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM NDS_DT_DATES_SEL(''' + DateToStr( aDateBeg ) + ''',Null )ORDER BY DATE_INVOICE DESC';
               aDataSet.Open;
             end;

    cbTill : begin
               aDataSet.Close;
               aDataSet.SQLs.SelectSQL.Clear;
               aDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM NDS_DT_DATES_SEL( Null,''' + DateToStr( aDateEnd ) + ''')ORDER BY DATE_INVOICE DESC';
               aDataSet.Open;
             end;

    cbBoth : begin
               aDataSet.Close;
               aDataSet.SQLs.SelectSQL.Clear;
               aDataSet.SQLs.SelectSQL.Text := 'SELECT * FROM NDS_DT_DATES_SEL(''' + DateToStr( aDateBeg ) + ''',''' + DateToStr( aDateEnd ) + ''')ORDER BY DATE_INVOICE DESC';
               aDataSet.Open;
             end;
  end;

end;} //End of procedure GetDateInv

//function IsDateValid( const aDateBeg, aDateEnd: String; const aDateCount: TCheckedBoxes ): Boolean ;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	IsDateValid                                                                *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Проверяет корректность значений дат начала и конца интервала времени.      *
*                                                                              *
* IN:                                                                          *
*       aDateBeg   - дата начала интервала времени.                            *
*       aDateEnd   - дата конца интервала времени.                             *
*       aDateCount - кол-во используемыж дат.                                  *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       Result                                                                 *
*                                                                              *
* RESULT: Boolean.                                                             *
*                                                                              *
*******************************************************************************}

{begin

  case aDateCount of

    cbNone : begin
               Result := True;
             end;

    cbFrom : begin

               if Trim( aDateBeg ) = ''
               then
                 Result := False
               else
                 Result := True;

             end;

    cbTill : begin

               if Trim( aDateEnd ) = ''
               then
                 Result := False
               else
                 Result := True;

             end;

    cbBoth : begin

               if ( ( Trim( aDateBeg ) <> '' ) and ( Trim( aDateEnd ) <> '' ) ) AND ( StrToDate( aDateBeg ) <= StrToDate( aDateEnd ) )
               then
                 Result := True
               else
                 Result := False;

             end;
  end;

end;  //End of function IsDateValid

procedure GetSetUpInfo( aDataSet: TpFIBDataSet; const aSetUpInfo: PSetUp );}

{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	GetSetUpInfo                                                               *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
*	Возвращает значения системных настроек.                                    *
*                                                                              *
* IN:                                                                          *
*       aDataSet   - набор данных.                                             *
*       aSetUpInfo - укзатель на структуру типа "вариантная запись".           *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       aSetUpInfo                                                             *
*                                                                              *
* RESULT: Несмотря на то, что укзатель на структуру aSetUpInfo объявлен как    *
*         константа, значения полей структуры изменяются, а значение адреса,   *
*         который укзывает на эту структуру остаёться прежним.                 *
*                                                                              *
*******************************************************************************}

{begin

  aDataSet.Close;
  aDataSet.SQLs.SelectSQL.Clear;

    case Ord( PSetUp( aSetUpInfo )^.StProcName ) of

      0 : begin
            aDataSet.SQLs.SelectSQL.Text := PSetUp( aSetUpInfo )^.SQLText;
            aDataSet.Open;
			PSetup( aSetUpInfo )^.IdRecord    := aDataSet.FBN('ID_RECORD'        ).AsInteger;
			PSetup( aSetUpInfo )^.DaysCount   := aDataSet.FBN('DAYS_COUNT_BEFORE').AsInteger;
            PSetup( aSetUpInfo )^.Pogreshnost := aDataSet.FBN('POGRESHNOST'      ).AsCurrency;
          end;

      1 : begin
            aDataSet.SQLs.SelectSQL.Text := PSetUp( aSetUpInfo )^.SQLText;
            aDataSet.Open;
            PSetup( aSetUpInfo )^.IdRecord   := aDataSet.FBN('ID_RECORD'        ).AsInteger;
            PSetUp( aSetUpInfo )^.DateRate   := aDataSet.FBN('DATE'             ).AsDateTime;
            PSetUp( aSetUpInfo )^.FixedRate  := aDataSet.FBN('FIXED_RATE'       ).AsFloat;
            PSetUp( aSetUpInfo )^.UaTerrRate := aDataSet.FBN('UA_TERRITORY_RATE').AsFloat;
            PSetUp( aSetUpInfo )^.ExportRate := aDataSet.FBN('EXPORT_RATE'      ).AsFloat;
          end;

      2 : begin
            aDataSet.SQLs.SelectSQL.Text := PSetUp( aSetUpInfo )^.SQLText;
            aDataSet.Open;
            PSetUp( aSetUpInfo )^.FixedRate  := aDataSet.FBN('OUT_FIXED_RATE'       ).AsFloat;
            PSetUp( aSetUpInfo )^.UaTerrRate := aDataSet.FBN('OUT_UA_TERRITORY_RATE').AsFloat;
            PSetUp( aSetUpInfo )^.ExportRate := aDataSet.FBN('OUT_EXPORT_RATE'      ).AsFloat;
          end;
    end;

end; } //End of procedure GetSetUpInfo

function SortArray( var aArray: TIntArray ): Boolean;

{*******************************************************************************
*                                                                              *
* Название функции :                                                           *
*                                                                              *
*	SortArray                                                                  *
*                                                                              *
* Назначение функции :                                                         *
*                                                                              *
*	Сортирует элементы динамического массива по возрастанию по методу Шелла.   *
*                                                                              *
* IN:                                                                          *
*       aArray   - исходный динамический массив.                               *
*                                                                              *
* OUT:                                                                         *
*                                                                              *
*       Result: Boolean                                                        *
*                                                                              *
* RESULT: Функция возвращает false, если был передан пустой массив .           *
*                                                                              *
*******************************************************************************}

var
    i        : Integer;
    Step     : Integer;
    Temp     : Integer;
    StepDone : Boolean;

begin

  if aArray <> nil
  then begin

    Step := High( aArray ) div 2;

    repeat

        repeat

          StepDone := True;

          for i := Low( aArray ) to ( High( aArray ) - Step ) do
          begin

            if aArray[i] > aArray[i + Step]
            then begin
              Temp             := aArray[i];
              aArray[i]        := aArray[i + Step];
              aArray[i + Step] := Temp;
              StepDone         := False;
            end;

          end;

        until( StepDone );

        Step := Step div 2;

    until ( Step = 0 );

    Result := True;
  end
  else
    Result := False;

end;  //End of function SortArray

function CheckDBFStructure( aSource: THalcyonDataSet; const aDBFFileName: String; aFields: array of TFieldRec; aErrorMsg: array of String; aHWND: HWND ): TImportCheckError;

{********************************************************************************
*                                                                               *
* Название функции :                                                            *
*                                                                               *
*	CheckDBFStructure                                                           *
*                                                                               *
* Назначение функции :                                                          *
*                                                                               *
*	Проверяет соответствие DBF-таблицы заданной структуре.                      *
*                                                                               *
* IN:                                                                           *
*       aSource      - НД, содержащий DBF-таблицу, подлежащую проверке.         *
*       aFields      - список полей, по которым необходимо выполнить проверку.  *
*       aErrorMsg    - список сообщений об ошибках, обнаруженных в ходе проверки*
*       aDBFFileName - путь к DBF-файлу, содержащему таблицу для проверки.      *
*                                                                               *
* OUT:                                                                          *
*                                                                               *
*       Result: TImportCheckError                                               *
*                                                                               *
* RESULT: Функция в результате проверки возвращает:                             *
*                                                                               *
*        ectNone           - ошибки не были обнаружены.                         *
*        ectFNUnknown      - поле с заданным именем не найдено.                 *
*        ectFTIcompatible  - тип поля не соответствует ожидаемому.              *
*        ectParamsNotFound - параметры для проверки отсутствуют.                *
*                                                                               *
********************************************************************************}
var
    i, n   : Integer;
    vField : TField;
begin

    //Получаем структуру + данные из DBF-файла
    if aSource.Active
    then
        aSource.Close;

    aSource.TableName := aDBFFileName;
    aSource.Open;
    n := High( aFields );

    //Проверяем: не пуст ли массив парметров полей?
    if n = -1
    then begin
        Result := ectParamsNotFound;
        Exit;
    end
    else begin
        Result := ectNone;
    end;

    //Проверяем соответствие полей НД параметрам процедуры импорта
    for i := Low( aFields ) to n
    do begin

        with aFields[i]
        do begin

            vField := aSource.FindField( FieldName );

            //Проверяем имя поля
            if vField = nil
            then begin
                Result := ectFNUnknown;
//                MessageBox( aHWND, PChar( aErrorMsg[0] ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
                Exit;
            end
            else
                //Проверяем тип поля
                if vField.DataType <> FieldType
				then begin
					Result := ectFTIcompatible;
//                    MessageBox( aHWND, PChar( aErrorMsg[1] ), PChar( sMsgCaptionErr ), MB_OK or MB_ICONERROR );
//                    Exit;
				end;
		end;

	end;

end;  //End of function CheckDBFStructure

procedure SetFirstZero( var aDigit: String );
{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	SetFirstZero                                                               *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Добавляет к цифре управляющий ноль.                                          *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aDigit - цифра, подлежащая преобразованию.                              *
*                                                                              *
*******************************************************************************}
begin
	if StrToInt( aDigit ) < 10
	then
		aDigit := '0' + aDigit;
end;  //End of procedure SetFirstZero

procedure FreeAndNilPTR( var aPointer: Pointer; const aPTRIsUntyped: Boolean = False );
{*******************************************************************************
*                                                                              *
* Название процедуры :                                                         *
*                                                                              *
*	FreeAndNilPTR                                                              *
*                                                                              *
* Назначение процедуры :                                                       *
*                                                                              *
* Освобождает память, выделенную под указатель и удаляет ссылку на ее адрес.   *
*                                                                              *
* IN:                                                                          *
*                                                                              *
*      aPointer      - ссылка на указатель.                                    *
*      aPTRIsUntyped - признак, показывающий явл. ли указатель типизированным  *
*                      или нет.                                                *
*                                                                              *
*******************************************************************************}
begin
    if aPointer <> nil
    then begin

        if aPTRIsUntyped
        then
            FreeMemory( aPointer )
        else
            Dispose( aPointer );

        aPointer := nil;
    end;
end;  //End of procedure FreeAndNilPTR

function GetMonthName(d : TDateTime) : Shortstring;
var
 m : word;
begin
 Result := '';

 m := MonthOf(d);

 case m of
   1  : Result := 'Январь';
   2  : Result := 'Февраль';
   3  : Result := 'Март';
   4  : Result := 'Апрель';
   5  : Result := 'Май';
   6  : Result := 'Июнь';
   7  : Result := 'Июль';
   8  : Result := 'Август';
   9  : Result := 'Сентябрь';
   10 : Result := 'Октябрь';
   11 : Result := 'Ноябрь';
   12 : Result := 'Декабрь';
 end;
end;

end.
