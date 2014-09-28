unit uPrK_Filtr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxContainer, cxEdit, FIBQuery, pFIBQuery, pFIBStoredProc, DB,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase,AArray,ibase,ib_externals,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  cxSplitter, cxGroupBox, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxLookAndFeelPainters,
  StdCtrls, cxButtons, ActnList, RxMemDS, cxCalendar;

type
  TFormPrK_Filtr = class(TForm)
    DataBasePrK: TpFIBDatabase;
    TransactionReadPrK: TpFIBTransaction;
    TransactionWritePrK: TpFIBTransaction;
    DataSourcePrK: TDataSource;
    DataSetPrK: TpFIBDataSet;
    StoredProcPrK: TpFIBStoredProc;
    cxEditStyleControllerPrK: TcxEditStyleController;
    StyleRepositoryPrK: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyleHeader: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyleInactive: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyleBackGround_Content: TcxStyle;
    cxStyleSelection: TcxStyle;
    cxGroupBoxKategory: TcxGroupBox;
    cxGridPrK: TcxGrid;
    cxGridPrKDBTableView1: TcxGridDBTableView;
    colShort_name: TcxGridDBColumn;
    cxGridPrKLevel1: TcxGridLevel;
    cxGroupBoxSelectedKategory: TcxGroupBox;
    cxGroupBoxComponent: TcxGroupBox;
    cxSplitterKateg: TcxSplitter;
    DataSetComboBox: TpFIBDataSet;
    DataSourceComboBox: TDataSource;
    cxGroupBoxComboBox: TcxGroupBox;
    cxLookupComboBoxFiltr: TcxLookupComboBox;
    cxGroupBoxTextBox: TcxGroupBox;
    cxTextEditFiltr: TcxTextEdit;
    cxGroupBox2: TcxGroupBox;
    cxButtonCansel: TcxButton;
    cxButtonFiltr: TcxButton;
    cxButtonSelectKat: TcxButton;
    ActionListPrKFiltr: TActionList;
    ActionFiltr: TAction;
    ActionExit: TAction;
    ActionSelectKateg: TAction;
    cxGridPrKSectedKat: TcxGrid;
    cxGridPrKSectedKatDBTableView1: TcxGridDBTableView;
    colSHOW_TEXT: TcxGridDBColumn;
    cxGridPrKSectedKatLevel1: TcxGridLevel;
    RxMemoryDataSelectedKat: TRxMemoryData;
    DataSourceSelectedKat: TDataSource;
    colNPPSelectedKat: TcxGridDBColumn;
    colSQL_TEXT: TcxGridDBColumn;
    cxGroupBoxDate: TcxGroupBox;
    cxDateEditDate: TcxDateEdit;
    cxGroupBoxIntTextBox: TcxGroupBox;
    cxTextEditIntFiltr: TcxTextEdit;
    cxGroupBoxNum5_2MaskEdit: TcxGroupBox;
    cxMaskEditNum5_2: TcxMaskEdit;
    RxMemoryDataSqlTextForFiltr: TRxMemoryData;
    DataSetNaborID_DT_ABIT: TpFIBDataSet;
    colNpp: TcxGridDBColumn;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure DataSetPrKAfterScroll(DataSet: TDataSet);
    procedure ActionExitExecute(Sender: TObject);
    procedure ActionSelectKategExecute(Sender: TObject);
    procedure ActionFiltrExecute(Sender: TObject);
    procedure cxTextEditIntFiltrKeyPress(Sender: TObject; var Key: Char);
  private
    DBHANDLE                :TISC_DB_HANDLE;
    ResultArray             :TAArray;
    TextViewColor           :TColor;
    IndLang                 :integer;
    CanAfterScroll          :Boolean;
    Layout: array[0.. KL_NAMELENGTH] of char;
    FSelectSQLTextPrK: String;
    FSelectSQLTextComboBox: String;
    ID_USER_GLOBAL          :Int64;
    ID_GOD_NABORA_GLOBAL    :Int64;
    FSelectSQLTextNaborID_DT_ABIT: AnsiString;
    procedure InicCaption;
    procedure FiltrOnTextBox;
    procedure FiltrOnComboBox;
    procedure FiltrOnDate;
    procedure VisibleComponent; // отслеживает какие клмпоненты показывать
    procedure SelectTextBox;
    procedure SelectComboBox;
    procedure SelectDate;
    procedure SelectIntTextBox;
    procedure SelectNum5_2MaskEdit;
    procedure SetSelectSQLTextPrK(const Value: String);
    procedure SetSelectSQLTextComboBox(const Value: String);
    function  SQL_TEXT_DUPLICATE(aSql_Text: string): integer;
    procedure SetSelectSQLTextNaborID_DT_ABIT(const Value: AnsiString);
  public
    constructor Create(aOwner: TComponent;aParam :TAArray);overload;
    Property SelectSQLTextPrK             :String read FSelectSQLTextPrK write SetSelectSQLTextPrK;
    Property SelectSQLTextComboBox        :String read FSelectSQLTextComboBox write SetSelectSQLTextComboBox;
    Property SelectSQLTextNaborID_DT_ABIT :AnsiString read FSelectSQLTextNaborID_DT_ABIT write SetSelectSQLTextNaborID_DT_ABIT;
  end;

  procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);stdcall;
  exports   ShowAllPrkBpl;


var
  FormPrK_Filtr: TFormPrK_Filtr;

implementation
uses
  uPrK_Resources,uConstants,uPrK_Loader;
{$R *.dfm}

procedure ShowAllPrkBpl (aOwner: TComponent;aParam :TAArray);
var
 T :TFormPrK_Filtr;
begin
   T:=TFormPrK_Filtr.Create(aOwner,aParam);

   T.FormStyle:= aParam['Input']['aFrmStyle'].AsVariant;
   case T.FormStyle of
     fsNormal:   begin
                   T.ShowModal;
                  // T.ActionVibrat.Enabled:=true;
                  // T.dxBarLargeButtonVibrat.Visible:=ivAlways;
                 end;
     fsMDIChild: begin
                 //  T.ActionVibrat.Enabled:=false;
                 //  T.dxBarLargeButtonVibrat.Visible:=ivNever;
                 end;
     else
        T.Free;
   end;
end;

{ TFormPrK_Filtr }

constructor TFormPrK_Filtr.Create(aOwner: TComponent; aParam: TAArray);
begin
   if Assigned(PVoid(aParam['Input']['aDBHANDLE'])) then
   begin
      DBHANDLE      :=PVoid(aParam['Input']['aDBHANDLE'].asInteger);
      ResultArray   :=aParam;
      IndLang       :=SelectLanguage;
      TextViewColor :=cl3DLight;
      ID_USER_GLOBAL         :=ResultArray['Input']['ID_USER'].AsInt64;
      ID_GOD_NABORA_GLOBAL   :=ResultArray['Input']['GodNabora'].AsInt64;
      inherited Create(aOwner);
      if SelectShemaColor=1 then
       begin
          cxStyleBackGround_Content.Color           := $00EBC4A4;
          cxStyleInactive.Color                     := $00F7EAD9;
          cxEditStyleControllerPrK.Style.Color      := $00EBC4A4;
       end;
   end
   else ShowMessage('Ошибка HANDLE`a Базы');
end;

procedure TFormPrK_Filtr.FormShow(Sender: TObject);
begin
                            {422-урк, 409-англ, 419-рус}
    LoadKeyboardLayout( StrCopy(Layout,nLayoutLang[IndLang]),KLF_ACTIVATE);
end;

procedure TFormPrK_Filtr.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if FormStyle = fsMDIChild then begin
     ResultArray.Free;
     ResultArray:=nil;
     Action:=caFree;
   end;
end;

procedure TFormPrK_Filtr.FormCreate(Sender: TObject);
begin
   InicCaption;

   SelectSQLTextPrK:='Select * from PRK_SP_FND_KATEGORY_SELECT';
end;

procedure TFormPrK_Filtr.InicCaption;
begin
  TFormPrK_Filtr(self).Caption       :=nFormPrK_Filtr_Caption[IndLang];
  cxGroupBoxKategory.Caption         :=ncxGroupBoxFiltrKategory[IndLang];
  cxGroupBoxSelectedKategory.Caption :=ncxGroupBoxSelectedFiltrKat[IndLang];
  colShort_name.Caption              :=ncolName[IndLang];
  colNPP.Caption                     :=ncolNpp[IndLang];
  colNPPSelectedKat.Caption          :=ncolNpp[IndLang];
  colSHOW_TEXT.Caption               :=ncolCondition[IndLang];
  ActionExit.Caption                 :=nActionExit[IndLang];
  ActionFiltr.Caption                :=nActionFiltr[IndLang];
  ActionSelectKateg.Caption          :=nAction_Vibrat[IndLang];
  ActionExit.Hint                    :=nHintAction_Exit[IndLang];
  ActionFiltr.Hint                   :=nHintActionFiltr[IndLang];
  ActionSelectKateg.Hint             :=nHintAction_Vibrat[IndLang];

  cxGroupBoxTextBox.Caption          :=ncxGroupBoxDataFoFiltr[IndLang];
  cxGroupBoxComboBox.Caption         :=ncxGroupBoxDataFoFiltr[IndLang];
  cxGroupBoxDate.Caption             :=ncxGroupBoxDataFoFiltr[IndLang];
  cxGroupBoxIntTextBox.Caption       :=ncxGroupBoxDataFoFiltr[IndLang];
  cxGroupBoxNum5_2MaskEdit.Caption   :=ncxGroupBoxDataFoFiltr[IndLang];
end;

procedure TFormPrK_Filtr.SetSelectSQLTextPrK(const Value: String);
begin
  CanAfterScroll:=false;
  FSelectSQLTextPrK := Value;
    DataBasePrK.close;
    DataSetPrK.Active                          :=false;
    DataBasePrK.Handle                         :=DBHANDLE;
    DataBasePrK.DefaultTransaction             := TransactionReadPrK;
    DataSetPrK.Database                        := DataBasePrK;
    DataSetPrK.Transaction                     := TransactionReadPrK;
    DataSetPrK.SelectSQL.Clear;
    DataSetPrK.SQLs.SelectSQL.Text             := FSelectSQLTextPrK;
    DataSetPrK.CloseOpen(false);
  CanAfterScroll:=true;
  cxGridPrKDBTableView1.NavigatorButtons.Next.Click;
  cxGridPrKDBTableView1.NavigatorButtons.Prior.Click
end;

procedure TFormPrK_Filtr.SetSelectSQLTextNaborID_DT_ABIT(
  const Value: AnsiString);
begin
  FSelectSQLTextNaborID_DT_ABIT := Value;
    DataSetNaborID_DT_ABIT.Active                          :=false;
    DataSetNaborID_DT_ABIT.Database                        := DataBasePrK;
    DataSetNaborID_DT_ABIT.Transaction                     := TransactionReadPrK;
    DataSetNaborID_DT_ABIT.SelectSQL.Clear;
    DataSetNaborID_DT_ABIT.SQLs.SelectSQL.Text             := FSelectSQLTextNaborID_DT_ABIT;
    DataSetNaborID_DT_ABIT.CloseOpen(false);
    DataSetNaborID_DT_ABIT.FetchAll;
end;

procedure TFormPrK_Filtr.DataSetPrKAfterScroll(DataSet: TDataSet);
begin
  if CanAfterScroll=true then
  begin
   VisibleComponent;
   case DataSetPrK.fbn('ID_SP_FND_COMPONENT').asinteger of
     1: begin {TextBox}
          FiltrOnTextBox; // pystaya proc
        end;
     2: begin {ComboBox}
          FiltrOnComboBox;
        end;
     3: begin {DateEdit}
          FiltrOnDate // pystaya proc
        end;
   end
  end;
end;

procedure TFormPrK_Filtr.VisibleComponent;
var
  i: integer;
begin
   for i := 0 to cxGroupBoxComponent.ControlCount-1 do
   begin
     if cxGroupBoxComponent.Controls[i] is TcxGroupBox then
       begin
          TcxGroupBox(cxGroupBoxComponent.Controls[i]).Visible:=False;
       end;
   end;
  // разбито специадьно на два цикла чтобы не мигало появление компонента 
   for i := 0 to cxGroupBoxComponent.ControlCount-1 do
   begin
     if cxGroupBoxComponent.Controls[i] is TcxGroupBox then
       begin
          if cxGroupBoxComponent.Controls[i].Tag=DataSetPrK.fbn('ID_SP_FND_COMPONENT').asinteger
           then begin
             TcxGroupBox(cxGroupBoxComponent.Controls[i]).Visible:=true;
             TcxGroupBox(cxGroupBoxComponent.Controls[i]).Width  :=320;
           end;
       end;
   end;

end;

procedure TFormPrK_Filtr.FiltrOnTextBox;
begin
  //
end;

procedure TFormPrK_Filtr.FiltrOnComboBox;
begin
  DataSourceComboBox.Enabled :=false;
  SelectSQLTextComboBox                          :=DataSetPrK.fbn('SELECT_STATEMANT').asString;
  cxLookupComboBoxFiltr.Properties.KeyFieldNames :=DataSetPrK.fbn('WHERE_STATEMANT').asString;
  DataSourceComboBox.Enabled :=true;
end;

procedure TFormPrK_Filtr.FiltrOnDate;
begin
 //
end;

procedure TFormPrK_Filtr.SetSelectSQLTextComboBox(const Value: String);
begin
  FSelectSQLTextComboBox := Value;
    DataSetComboBox.Active                          :=false;
    DataSetComboBox.Database                        := DataBasePrK;
    DataSetComboBox.Transaction                     := TransactionReadPrK;
    DataSetComboBox.SelectSQL.Clear;
    DataSetComboBox.SQLs.SelectSQL.Text             :=FSelectSQLTextComboBox;
    DataSetComboBox.Prepare;
    if DataSetComboBox.ParamCount>0 then
       DataSetComboBox.ParamByName('ID_SP_GOD_NABORA').AsInt64 :=ID_GOD_NABORA_GLOBAL;
    DataSetComboBox.CloseOpen(false);
end;

procedure TFormPrK_Filtr.ActionExitExecute(Sender: TObject);
begin
   close;
end;

procedure TFormPrK_Filtr.cxTextEditIntFiltrKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '.') or (Key=',') then Key := Chr(0);
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then     Key := Chr(0);
end;

function TFormPrK_Filtr.SQL_TEXT_DUPLICATE(aSql_Text: string): integer;
var
   SQL_TEXT_loc: string;
begin
  {Так как условие SQL_TEXT должно быть уникальным, то и позицироваться будем по нем}
    RxMemoryDataSelectedKat.open;
    if RxMemoryDataSelectedKat.RecordCount<1
     then SQL_TEXT_loc:=''
     else SQL_TEXT_loc:= RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString;
    RxMemoryDataSelectedKat.First;
    while not RxMemoryDataSelectedKat.Eof do
     begin
       if RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString=aSql_Text then
        begin
         result:=1;
         RxMemoryDataSelectedKat.Locate('SQL_TEXT',SQL_TEXT_loc,[]);
         exit;
        end;
       RxMemoryDataSelectedKat.Next;
     end;
    result:=0;
end;

procedure TFormPrK_Filtr.ActionSelectKategExecute(Sender: TObject);
begin
   case DataSetPrK.fbn('ID_SP_FND_COMPONENT').asinteger of
     1: begin {TextBox} {сделать поверку на совпадение первых символов п не на полное равентсво}
           SelectTextBox; // добавляет данные для запроса
           cxTextEditFiltr.SetFocus;
        end;
     2: begin {ComboBox}
           SelectComboBox;
           cxLookupComboBoxFiltr.SetFocus;
        end;
     3: begin {DateEdit}
           SelectDate;
           cxDateEditDate.SetFocus;
        end;
     4: begin {IntTextEdit}
           SelectIntTextBox;
           cxTextEditIntFiltr.SetFocus;
        end;
     5: begin {Num5_2MaskEdit}
           SelectNum5_2MaskEdit;
           cxMaskEditNum5_2.SetFocus;
        end;
     end;
end;

procedure TFormPrK_Filtr.SelectTextBox;
var
  SQL_TEXT_loc: string;      // ' FIO like'+'''Л%''';
begin
  If Trim(cxTextEditFiltr.Text)='' then exit;
  SQL_TEXT_loc:=AnsiUpperCase(DataSetPrK.FBN('WHERE_STATEMANT').AsString+' like '''+cxTextEditFiltr.Text+'%''');
  if SQL_TEXT_DUPLICATE(SQL_TEXT_loc)=1 then
   begin
     ShowMessage(nMsgSelectedBefore[IndLang]);
     exit;
   end;
  RxMemoryDataSelectedKat.open;
  RxMemoryDataSelectedKat.Insert;
   RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger      :=DataSetPrK.FBN('Npp').AsInteger;
   RxMemoryDataSelectedKat.FieldByName('SHOW_TEXT').AsString :=AnsiUpperCase(DataSetPrK.FBN('SHORT_NAME').AsString+': '+cxTextEditFiltr.Text);
   RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString  :=SQL_TEXT_loc;
  RxMemoryDataSelectedKat.Post;
  cxTextEditFiltr.Text:='';
end;

procedure TFormPrK_Filtr.SelectComboBox;
var
  SQL_TEXT_loc: string;
begin
  If Trim(cxLookupComboBoxFiltr.Text)='' then exit;
  SQL_TEXT_loc:=AnsiUpperCase(DataSetPrK.FBN('WHERE_STATEMANT').AsString+'='+DataSetComboBox.FBN(DataSetPrK.fbn('WHERE_STATEMANT').asString).AsString);
  if SQL_TEXT_DUPLICATE(SQL_TEXT_loc)=1 then
   begin
     ShowMessage(nMsgSelectedBefore[IndLang]);
     exit;
   end;
  RxMemoryDataSelectedKat.open;
  RxMemoryDataSelectedKat.Insert;
   RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger      :=DataSetPrK.FBN('Npp').AsInteger;
   RxMemoryDataSelectedKat.FieldByName('SHOW_TEXT').AsString :=DataSetPrK.FBN('SHORT_NAME').AsString+': '+DataSetComboBox.fbn('SHORT_NAME').asString;
   RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString  :=SQL_TEXT_loc;
  RxMemoryDataSelectedKat.Post;
  cxLookupComboBoxFiltr.Text:='';
end;

procedure TFormPrK_Filtr.SelectDate;
var
  SQL_TEXT_loc: string;
begin
  If Trim(cxDateEditDate.Text)='' then exit;
  SQL_TEXT_loc:=AnsiUpperCase(DataSetPrK.FBN('WHERE_STATEMANT').AsString+'='''+cxDateEditDate.Text+'''');
  if SQL_TEXT_DUPLICATE(SQL_TEXT_loc)=1 then
   begin
     ShowMessage(nMsgSelectedBefore[IndLang]);
     exit;
   end;
  RxMemoryDataSelectedKat.open;
  RxMemoryDataSelectedKat.Insert;
   RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger      :=DataSetPrK.FBN('Npp').AsInteger;
   RxMemoryDataSelectedKat.FieldByName('SHOW_TEXT').AsString :=AnsiUpperCase(DataSetPrK.FBN('SHORT_NAME').AsString+': '+cxDateEditDate.Text);
   RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString  :=SQL_TEXT_loc;
  RxMemoryDataSelectedKat.Post;
  cxDateEditDate.Text:='';
end;

procedure TFormPrK_Filtr.SelectIntTextBox;
var
  SQL_TEXT_loc: string;
begin
  If Trim(cxTextEditIntFiltr.Text)='' then exit;
  SQL_TEXT_loc:=AnsiUpperCase(DataSetPrK.FBN('WHERE_STATEMANT').AsString+'='''+cxTextEditIntFiltr.Text+'''');
  if SQL_TEXT_DUPLICATE(SQL_TEXT_loc)=1 then
   begin
     ShowMessage(nMsgSelectedBefore[IndLang]);
     exit;
   end;
  RxMemoryDataSelectedKat.open;
  RxMemoryDataSelectedKat.Insert;
   RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger      :=DataSetPrK.FBN('Npp').AsInteger;
   RxMemoryDataSelectedKat.FieldByName('SHOW_TEXT').AsString :=AnsiUpperCase(DataSetPrK.FBN('SHORT_NAME').AsString+': '+cxTextEditIntFiltr.Text);
   RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString  :=SQL_TEXT_loc;
  RxMemoryDataSelectedKat.Post;
  cxTextEditIntFiltr.Text:='';
end;

procedure TFormPrK_Filtr.SelectNum5_2MaskEdit;
var
  SQL_TEXT_loc: string;
begin
  If Trim(cxMaskEditNum5_2.Text)='' then exit;
  SQL_TEXT_loc:=AnsiUpperCase(DataSetPrK.FBN('WHERE_STATEMANT').AsString+'='''+cxMaskEditNum5_2.Text+'''');
  if SQL_TEXT_DUPLICATE(SQL_TEXT_loc)=1 then
   begin
     ShowMessage(nMsgSelectedBefore[IndLang]);
     exit;
   end;
  RxMemoryDataSelectedKat.open;
  RxMemoryDataSelectedKat.Insert;
   RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger      :=DataSetPrK.FBN('Npp').AsInteger;
   RxMemoryDataSelectedKat.FieldByName('SHOW_TEXT').AsString :=AnsiUpperCase(DataSetPrK.FBN('SHORT_NAME').AsString+': '+cxMaskEditNum5_2.Text);
   RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString  :=SQL_TEXT_loc;
  RxMemoryDataSelectedKat.Post;
  cxMaskEditNum5_2.Text:='';
end;

procedure TFormPrK_Filtr.ActionFiltrExecute(Sender: TObject);
var
   TextSqlZapros,TempText :AnsiString;
   ExistNpp : Boolean;
   InputParam :TAArray;
begin
    if RxMemoryDataSelectedKat.RecordCount<1  then exit;

    DataSourceSelectedKat.Enabled:=false;
    RxMemoryDataSqlTextForFiltr.Close;
    RxMemoryDataSelectedKat.First;
    while not RxMemoryDataSelectedKat.Eof do
     begin
        ExistNpp:=false;
        RxMemoryDataSqlTextForFiltr.Open;
        RxMemoryDataSqlTextForFiltr.First;
        while not RxMemoryDataSqlTextForFiltr.eof do
         begin
           if RxMemoryDataSqlTextForFiltr.FieldByName('Npp').AsInteger=
              RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger  then
            begin
              ExistNpp:=true;
              TempText:=RxMemoryDataSqlTextForFiltr.FieldByName('SQL_TEXT').AsVariant;
              RxMemoryDataSqlTextForFiltr.Open;
              RxMemoryDataSqlTextForFiltr.edit;
              RxMemoryDataSqlTextForFiltr.FieldByName('SQL_TEXT').AsVariant:=TempText+' or '+
                        RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString;
              RxMemoryDataSqlTextForFiltr.Post;
              break;
            end;
           RxMemoryDataSqlTextForFiltr.Next
         end;

        if ExistNpp=false then
        begin
           RxMemoryDataSqlTextForFiltr.Open;
           RxMemoryDataSqlTextForFiltr.Insert;
           RxMemoryDataSqlTextForFiltr.FieldByName('Npp').AsInteger     := RxMemoryDataSelectedKat.FieldByName('Npp').AsInteger;
           RxMemoryDataSqlTextForFiltr.FieldByName('SQL_TEXT').AsVariant:= RxMemoryDataSelectedKat.FieldByName('SQL_TEXT').AsString;
           RxMemoryDataSqlTextForFiltr.Post;
        end;
        RxMemoryDataSelectedKat.Next;
     end;

     TextSqlZapros:='';
     RxMemoryDataSqlTextForFiltr.First;
     while not RxMemoryDataSqlTextForFiltr.eof do
      begin
        if TextSqlZapros=''
         then TextSqlZapros:= '('+RxMemoryDataSqlTextForFiltr.FieldByName('SQL_TEXT').AsVariant+')'
         else TextSqlZapros:= TextSqlZapros+' and '+'('+RxMemoryDataSqlTextForFiltr.FieldByName('SQL_TEXT').AsVariant+')';
        RxMemoryDataSqlTextForFiltr.Next
      end;

  {ShowMessage(TextSqlZapros);
  DataSourceSelectedKat.Enabled:=true;}

  SelectSQLTextNaborID_DT_ABIT:='Select ID_DT_ABIT FROM PRK_FND_ID_ABIT_SELECT where '+TextSqlZapros;

 Screen.Cursor := crHourGlass;
  TextSqlZapros:='';
  DataSetNaborID_DT_ABIT.First;
  while not DataSetNaborID_DT_ABIT.eof do
  begin
    if TextSqlZapros=''
     then TextSqlZapros:=DataSetNaborID_DT_ABIT.FBN('ID_DT_ABIT').AsString
     else TextSqlZapros:=TextSqlZapros+','+DataSetNaborID_DT_ABIT.FBN('ID_DT_ABIT').AsString;
    DataSetNaborID_DT_ABIT.Next
  end;
Screen.Cursor := crDefault;

  if trim(TextSqlZapros)='' then
    begin
     ShowMessage(nMsgEmptyDataAfterFiltr[IndLang]);
     DataSourceSelectedKat.Enabled:=true;
     exit;
    end;

  TextSqlZapros:='('+TextSqlZapros+')';
          //ShowMessage(TextSqlZapros);
  InputParam :=TAArray.Create;
    InputParam['Name_Bpl'].AsString                     := 'PrK_Results_of_Filtr.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger          := Integer(DataBasePrK.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant          := fsMDIChild;
    //InputParam['Input']['aFrmStyle'].AsVariant          := fsNormal;
    InputParam['Input']['WHERE'].AsString               := TextSqlZapros;
    InputParam['Input']['ID_GOD_NABORA'].AsInt64        := ID_GOD_NABORA_GLOBAL;
    InputParam['Input']['ID_USER'].AsInt64              := ID_USER_GLOBAL;
  uPrK_Loader.ShowAllPrkBpl(nil,InputParam);

 close;

end;

end.
