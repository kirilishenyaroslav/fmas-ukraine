unit AdrSp_MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, dxBar, dxBarExtItems,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, IBase, ActnList,
  ImgList, uFormControl, FIBQuery, pFIBQuery, RxMemDS, StdCtrls,
  dxStatusBar, AdrSp_Consts, cxContainer, cxTextEdit,
  cxGridBandedTableView, AdrSp_Types, Address_ZMessages,
  cxLookAndFeelPainters, cxButtons, pFIBStoredProc;

type
  FormMode = (fsmShow, fsmSelect, fsmMSelect,fsmSearchPlaceMode);
  FormButton =  (fbAdd, fbModif, fbDelete, fbRefresh, fbSelect, fbExit);
  FormButtons = set of FormButton;

  TSpParams=Record
    FormCaption : string;
    ShowMode : FormMode;
    ShowButtons : FormButtons;
    Fields, FieldsName : string;
    KeyField : string;
    ReturnFields : string;
    AddFormClass, ModifFormClass : string;
    TableName : string;
    DeleteSQL : string;
    DBHandle : integer;
    Additional : variant;
    NameForSearch: string;
  end;

  TfmAdrSp = class(TForm)
    cxG_MainDBTableView1: TcxGridDBTableView;
    cxG_MainLevel1: TcxGridLevel;
    cxG_Main: TcxGrid;
    BarManager: TdxBarManager;
    InsertBtn: TdxBarLargeButton;
    UpdateBtn: TdxBarLargeButton;
    DeleteBtn: TdxBarLargeButton;
    SearchPanel: TPanel;
    ExitBtn: TdxBarLargeButton;
    DB: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    DSetMain: TpFIBDataSet;
    DSourceMain: TDataSource;
    ImageList1: TImageList;
    ActionList1: TActionList;
    AddA: TAction;
    ModifA: TAction;
    DelA: TAction;
    OkA: TAction;
    CancelA: TAction;
    RefreshA: TAction;
    RefreshBtn: TdxBarLargeButton;
    SelectBtn: TdxBarLargeButton;
    pFIBQ_Delete: TpFIBQuery;
    WriteTransaction: TpFIBTransaction;
    Label1: TLabel;
    MemDSet: TRxMemoryData;
    BarStatic1: TdxBarStatic;
    StatusBar: TdxStatusBar;
    SearchEdit: TcxTextEdit;
    StyleRepository: TcxStyleRepository;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    cxStyle29: TcxStyle;
    cxStyle30: TcxStyle;
    cxStyle31: TcxStyle;
    cxStyle32: TcxStyle;
    cxStyle33: TcxStyle;
    cxStyle34: TcxStyle;
    cxStyle35: TcxStyle;
    cxStyle36: TcxStyle;
    cxStyle37: TcxStyle;
    cxStyle38: TcxStyle;
    cxStyle39: TcxStyle;
    cxStyle40: TcxStyle;
    cxStyle41: TcxStyle;
    cxStyle42: TcxStyle;
    StyleGray: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheetDevExpress: TcxGridBandedTableViewStyleSheet;
    Timer1: TTimer;
    SearchBtn: TcxButton;
    MakeOldBtn: TdxBarLargeButton;
    MakeOldA: TAction;
    StProc: TpFIBStoredProc;
    function GetEditForm(Mode: TFormMode; FormClass: string; var KeyValue: variant): Boolean;
    procedure AddAExecute(Sender: TObject);
    procedure ModifAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure CancelAExecute(Sender: TObject);
    procedure RefreshAExecute(Sender: TObject);
    procedure FilterAExecute(Sender: TObject);
    procedure OkAExecute(Sender: TObject);
    procedure cxG_MainDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxG_MainDBTableView1DblClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure SearchEditKeyPress(Sender: TObject; var Key: Char);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure SearchBtnClick(Sender: TObject);
    procedure SearchEditFocusChanged(Sender: TObject);
    procedure MakeOldAExecute(Sender: TObject);
  private
    Fields, FieldsName, ReturnFields : array of string;
    NFields, NFieldsName, NReturnFields : integer;
    pLanguageIndex:Integer;
//******************************************************************************
//                               ЗАПЛАТКА
//******************************************************************************
    pRegimeIsNormal:Boolean;
    pUnNormalProcedure:String;
    function StringForSearch(AText:String):String;
//******************************************************************************
    procedure SearchByFilter;
    procedure UnNormalRefresh;
  public
    SpravParams : TSpParams;
    OutPut : TRxMemoryData;
    UseResult : Boolean; // Обозначает не только выбор, но и изм. в справочнике
    function PrepareForm(Params : TSpParams) : boolean;
    constructor Create(AOwner:TComponent); reintroduce;
    { Public declarations }
  end;

function GetAdressesSp(AParams : TSpParams; var AOutPut : TRxMemoryData):boolean;stdcall;
procedure ShowInfo(DataSet: TDataSet);

exports GetAdressesSp;

implementation

uses {uAddModifForm,} StrUtils, Math, uAddCountry, uAddRegion, uAddDistrict,
     uAddPlace, uAddStreetForm, uAddCityArea;

{$R *.dfm}

function TfmAdrSp.StringForSearch(AText:String):String;
var i,l:Integer;
begin
  Result:=AText;
  l:=Length(AText);
  for i:=l downto 1 do
    if AText[i]='''' then
      Insert('''',Result,i);
  if Result='' then
    Result:=' ';
end;

procedure TfmAdrSp.UnNormalRefresh;
var
   OptionForSearch: String;
begin
 {  OptionForSearch := '';
   if SpravParams.ShowMode=fsmSearchPlaceMode
   then OptionForSearch := ' where (name_country='+SpravParams.NameForSearch+')';
  } if DSetMain.Active then DSetMain.Close;
   if SpravParams.ShowMode=fsmSearchPlaceMode
   then DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM ADR_PLACE_S_BY_NAME_BY_COUNTRY('''+StringForSearch(SpravParams.NameForSearch)+''','''+StringForSearch(SearchEdit.Text)+''')'
   else DSetMain.SQLs.SelectSQL.Text:='SELECT * FROM '+pUnNormalProcedure+'('''+StringForSearch(SearchEdit.Text)+''')';
   DSetMain.Open;
end;

procedure TfmAdrSp.SearchByFilter;
begin
 if pRegimeIsNormal then
 begin
  cxG_MainDBTableView1.DataController.DataSet.Filtered := False;
  cxG_MainDBTableView1.DataController.DataSet.Filter := 'UPPER('+AnsiUpperCase(Fields[0])+') LIKE ''' +
                       AnsiUpperCase(SearchEdit.Text) + '%'' and '+Fields[0]+' is not null';
  cxG_MainDBTableView1.DataController.DataSet.Filtered := True;
  cxG_MainDBTableView1.ViewData.Expand(False);
 end
 else
   UnNormalRefresh;
// if SpravParams.ShowMode=fsmSearchPlaceMode
// then UnNormalRefresh;
end;

constructor TfmAdrSp.Create(AOwner:TComponent);
begin
  inherited Create(AOwner);
  pLanguageIndex:=GetLanguageIndex;
//******************************************************************************
  InsertBtn.Caption  := InsertBtn_Caption[pLanguageIndex];
  UpdateBtn.Caption  := UpdateBtn_Caption[pLanguageIndex];
  DeleteBtn.Caption  := DeleteBtn_Caption[pLanguageIndex];
  RefreshBtn.Caption := RefreshBtn_Caption[pLanguageIndex];
  SelectBtn.Caption  := SelectBtn_Caption[pLanguageIndex];
  ExitBtn.Caption    := ExitBtn_Caption[pLanguageIndex];

{  InsertBtn.Hint  := InsertBtn_Hint[pLanguageIndex];
  UpdateBtn.Hint  := UpdateBtn_Hint[pLanguageIndex];
  DeleteBtn.Hint  := DeleteBtn_Hint[pLanguageIndex];
  RefreshBtn.Hint := RefreshBtn_Hint[pLanguageIndex];
  SelectBtn.Hint  := SelectBtn_Hint[pLanguageIndex];
  ExitBtn.Hint    := ExitBtn_Hint[pLanguageIndex];
}
  StatusBar.Panels.Items[0].Text:=InsertBtn_Hint[pLanguageIndex];
  StatusBar.Panels.Items[1].Text:=UpdateBtn_Hint[pLanguageIndex];
  StatusBar.Panels.Items[2].Text:=DeleteBtn_Hint[pLanguageIndex];
  StatusBar.Panels.Items[3].Text:=RefreshBtn_Hint[pLanguageIndex];
  StatusBar.Panels.Items[4].Text:=SelectBtn_Hint[pLanguageIndex];
  StatusBar.Panels.Items[5].Text:=ExitBtn_Hint[pLanguageIndex];
//******************************************************************************

//******************************************************************************
  FormResize(Self);
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;

function GetAdressesSp(AParams : TSpParams; var AOutPut : TRxMemoryData):boolean;
var form: TfmAdrSp;
begin
  Result:=False;
  form:=TfmAdrSp.Create(nil);
  form.OutPut:=TRxMemoryData.Create(form);
  if (form.PrepareForm(AParams)) then
//   if (AParams.ShowMode=fsmSelect) or (AParams.ShowMode=fsmMSelect) then
    if (form.ShowModal=mrOk) then
      begin
        AOutPut.CopyStructure(form.OutPut);
        AOutPut.LoadFromDataSet(form.OutPut,form.OutPut.RecordCount,lmAppend);
        Result:=True;
      end
    else
      if form.UseResult then
        begin
          AOutPut.Filtered:=True; // Нехорошо, но придумать другое значит сильно переписать код.
        end;
  form.Free;
end;

function TfmAdrSp.PrepareForm(Params : TSpParams) : boolean;
  var i,j: integer;
begin
  try
    SpravParams:=Params;
    Caption:=SpravParams.FormCaption;

    if SpravParams.ShowMode=fsmShow then OkA.Visible:=False;
    pUnNormalProcedure:='ADR_PLACE_SELECT_SP_BY_NAME';
//Готовим базу
//    ShowMessage('Готовим базу');
    DB.Handle:=TISC_DB_HANDLE(SpravParams.DBHandle);
    DSetMain.SelectSQL.Text:='select '+SpravParams.Fields+' from '+SpravParams.TableName;   
    pFIBQ_Delete.SQL.Text:=SpravParams.DeleteSQL;
{    ShowMessage(SpravParams.Fields);
    ShowMessage(SpravParams.FieldsName);}

//Готовим поля
//    ShowMessage('Готовим поля');
    if Trim(SpravParams.Fields)='' then
     NFields:=0
    else
     begin
       NFields:=1;
       SetLength(Fields,NFields);
       for i:=1 to Length(SpravParams.Fields) do
         if SpravParams.Fields[i]<>',' then
          Fields[NFields-1]:=Fields[NFields-1]+SpravParams.Fields[i]
         else
          begin
            NFields:=NFields+1;
            SetLength(Fields, NFields);
          end;
     end;

    if Trim(SpravParams.FieldsName)='' then
     NFieldsName:=0
    else
     begin
       NFieldsName:=1;
       SetLength(FieldsName,NFieldsName);
       for i:=1 to Length(SpravParams.FieldsName) do
         if SpravParams.FieldsName[i]<>',' then
          FieldsName[NFieldsName-1]:=FieldsName[NFieldsName-1]+SpravParams.FieldsName[i]
         else
          begin
            NFieldsName:=NFieldsName+1;
            SetLength(FieldsName, NFieldsName);
          end;
     end;

    if Trim(SpravParams.ReturnFields)='' then
     NReturnFields:=0
    else
     begin
       NReturnFields:=1;
       SetLength(ReturnFields,NReturnFields);
       for i:=1 to Length(SpravParams.ReturnFields) do
         if SpravParams.ReturnFields[i]<>',' then
          ReturnFields[NReturnFields-1]:=ReturnFields[NReturnFields-1]+SpravParams.ReturnFields[i]
         else
          begin
            NReturnFields:=NReturnFields+1;
            SetLength(ReturnFields, NReturnFields);
          end;
     end;

//Готовим грид
//    ShowMessage('Готовим грид');
    for i:=0 to NReturnFields-1 do
    begin
      cxG_MainDBTableView1.CreateColumn;
      cxG_MainDBTableView1.Columns[i].DataBinding.FieldName:=ReturnFields[i];
      cxG_MainDBTableView1.Columns[i].Caption:=ReturnFields[i];
      cxG_MainDBTableView1.Columns[i].Visible:=False;
    end;

    j:=-1;
    for i:=0 to NFieldsName-1 do
    begin
      cxG_MainDBTableView1.CreateColumn;
      cxG_MainDBTableView1.Columns[i+NReturnFields].DataBinding.FieldName:=Fields[i];
      if FieldsName[i][Length(FieldsName)-1]='~' then
       begin
         j:=j+1;
         cxG_MainDBTableView1.Columns[i+NReturnFields].GroupIndex:=j;
         FieldsName[i][Length(FieldsName)-1]:=' ';
       end;
      cxG_MainDBTableView1.Columns[i+NReturnFields].Caption:=FieldsName[i];
      cxG_MainDBTableView1.Columns[i+NReturnFields].Visible:=True;
      cxG_MainDBTableView1.Columns[i+NReturnFields].MinWidth:=150;
    end;

{// на первом же видимом поле устанавливаем порядок сортировки по возрастанию 
   i:=0;
   while not cxG_MainDBTableView1.Columns[i].Visible do
        i:=i+1;
   cxG_MainDBTableView1.Columns[i].SortOrder:=soAscending;
}
//Готовим кнопки
//    ShowMessage('Готовим кнопки');
    AddA.Enabled:=fbAdd in SpravParams.ShowButtons;
    ModifA.Enabled:=fbModif in SpravParams.ShowButtons;
    DelA.Enabled:=fbDelete in SpravParams.ShowButtons;
    OkA.Enabled:=(fbSelect in SpravParams.ShowButtons)or(SpravParams.ShowMode=fsmSelect)or(SpravParams.ShowMode=fsmMSelect)
                 or(SpravParams.ShowMode=fsmSearchPlaceMode);
    CancelA.Enabled:=fbExit in SpravParams.ShowButtons;

 if Pos('ADR_PLACE_SELECT_SP(NULL,NULL)',SpravParams.TableName)=0 then
  begin
    pRegimeIsNormal:=True;
//    ShowMessage('Открываем датасет');
    DSetMain.Open;
// записываем название, на котором находились при вызове справочника, в поле поиска
    SearchEdit.Text:=SpravParams.NameForSearch;
    DSetMain.Locate(AnsiUpperCase(Fields[0]),SpravParams.NameForSearch,[]);
  end
 else
  begin
    pRegimeIsNormal:=False;
    pUnNormalProcedure:='ADR_PLACE_SELECT_SP_BY_NAME';
    SearchBtnClick(Self);
  end;
    UseResult:=False;

    Result:=True;
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      Result:=False;
    end;
  end;
end;

function TfmAdrSp.GetEditForm(Mode: TFormMode; FormClass: string; var KeyValue: variant): Boolean;
var
  ViewForm : TAdrEditForm;
  FClass: TPersistentClass;
begin
  if AnsiUpperCase(FormClass) = 'TADD_COUNTRY_FORM'  then ViewForm := TAdd_Country_Form.Create(Self, DB.Handle)
  else
  if AnsiUpperCase(FormClass) = 'TADD_REGION_FORM'   then ViewForm := TAdd_Region_Form.Create(Self, DB.Handle)
  else
  if AnsiUpperCase(FormClass) = 'TADD_DISTRICT_FORM' then ViewForm := TAdd_District_Form.Create(Self, DB.Handle)
  else
  if AnsiUpperCase(FormClass) = 'TADD_PLACE_FORM'    then ViewForm := TADD_PLACE_FORM.Create(Self, DB.Handle)
  else
  if AnsiUpperCase(FormClass) = 'TADD_STREET_FORM'   then ViewForm := TADD_STREET_FORM.Create(Self, DB.Handle)
  else
  if AnsiUpperCase(FormClass) = 'TADDCITYAREA'       then ViewForm := TADDCITYAREA.Create(Self, DB.Handle)
  else
   Begin
    ViewForm := nil;
    Result:=False;
    try
      FClass := GetClass(FormClass);

	  	if FClass <> nil then
        Application.CreateForm(TFormClass(FClass),ViewForm);
   	except
      on E:Exception do
        begin
          ZShowMessage('Помилка',E.Message,mtError,[mbOK]);
        end;
   	end;

    // проверяем, создалась форма или нет
   	if ViewForm = nil then
      begin
          ZShowMessage('Помилка','Не вдалося створити вікно!',mtError,[mbOK]);
          Exit;
      end;
    { Теперь из кода запроса находим данные по умолчанию. Следуют они, если их несколько,
      в порядке старшинства. Почему? Да я так написал.}
   end;
    if VarIsNull(KeyValue)
     then ViewForm.SetParams(DB.Handle,-1,SpravParams.Additional)
     else ViewForm.SetParams(DB.Handle,KeyValue,Null);

  If ViewForm.ShowModal = mrOk then
   begin
     KeyValue := ViewForm.ResultId;
     Result   := True;
   end;
  ViewForm.Release;
end;

procedure TfmAdrSp.AddAExecute(Sender: TObject);
var KeyValue : variant;
begin
  KeyValue:=null;
  if GetEditForm(fmAdd,SpravParams.AddFormClass,KeyValue) then
   begin
    if pRegimeIsNormal then
    begin
     DSetMain.Close;
     DSetMain.Open;
     DSetMain.Locate(SpravParams.KeyField,KeyValue,[]);
    end
    else
     UnNormalRefresh;
     UseResult:=True;
   end;
end;

procedure TfmAdrSp.ModifAExecute(Sender: TObject);
var KeyValue : variant;
begin
  KeyValue:=DSetMain[SpravParams.KeyField];
  if GetEditForm(fmModify,SpravParams.AddFormClass,KeyValue) then
   begin
    if pRegimeIsNormal then
    begin
     DSetMain.Close;
     DSetMain.Open;
     DSetMain.Locate(SpravParams.KeyField,KeyValue,[]);
    end
    else
      UnNormalRefresh;
     UseResult:=True;
   end;
end;

procedure TfmAdrSp.DelAExecute(Sender: TObject);
begin
  if VarIsNull(DSetMain[Fields[0]]) then Exit;
  if (ZShowMessage('Вилучення','Чи ви справді бажаєте вилучити запис "'+
           DSetMain[Fields[0]]+'"?',mtConfirmation,[mbYes,mbNo]) = mrNo) then Exit;
  try
    pFIBQ_Delete.Transaction.StartTransaction;
    pFIBQ_Delete.ParamByName(SpravParams.KeyField).AsVariant:=DSetMain[SpravParams.KeyField];
    pFIBQ_Delete.ExecProc;
    pFIBQ_Delete.Transaction.Commit;
    DSetMain.Close;
    DSetMain.Open;
    UseResult:=True;
  except on e: Exception do
    begin
      pFIBQ_Delete.Transaction.Rollback;
      ZShowMessage('Помилка','Не вдалося вилучити запис!'+#13+e.Message,mtError,[mbOK]);
    end;
  end;
end;

procedure TfmAdrSp.CancelAExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TfmAdrSp.RefreshAExecute(Sender: TObject);
var val:Variant;
begin
    if pRegimeIsNormal then
    begin
  val:=DSetMain[SpravParams.KeyField];
  DSetMain.Close;
  DSetMain.Open;
  DSetMain.Locate(SpravParams.KeyField,val,[]);
    end
    else
  UnNormalRefresh;
end;

procedure TfmAdrSp.FilterAExecute(Sender: TObject);
begin
    //
end;

procedure TfmAdrSp.OkAExecute(Sender: TObject);
var i,j,count:integer;
begin
  if (DSetMain.IsEmpty) then
   begin
     ModalResult:=0;
     Exit;
   end;
  for i:=1 to NReturnFields do
    Output.FieldDefs.Add(ReturnFields[i-1], ftVariant);

  Output.Open;
  if (cxG_MainDBTableView1.OptionsSelection.MultiSelect) then
   begin
     count:=cxG_MainDBTableView1.Controller.SelectedRowCount;
     for i:=0 to count-1 do
     begin
       Output.Append;
       for j:=0 to NReturnFields-1 do
         Output[ReturnFields[j]] := cxG_MainDBTableView1.Controller.SelectedRecords[i].Values[j];
       Output.Post;
     end;
   end
  else
   begin
     Output.Append;
       for j:=0 to NReturnFields-1 do
         Output[ReturnFields[j]] := cxG_MainDBTableView1.Controller.SelectedRecords[0].Values[j];
     Output.Post;
   end;
  ModalResult:=mrOk;
end;

procedure TfmAdrSp.cxG_MainDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{  if (Key = VK_F12) and (ssShift in Shift) then
   ShowInfo(cxG_MainDBTableView1.DataController.DataSource.DataSet);
}end;

procedure TfmAdrSp.cxG_MainDBTableView1DblClick(Sender: TObject);
begin
  if (OkA.Enabled) then OkA.Execute;
end;

procedure TfmAdrSp.FormResize(Sender: TObject);
var i:Integer;
begin
  for i:=0 to StatusBar.Panels.Count-1 do
    StatusBar.Panels[i].Width := StatusBar.Width div StatusBar.Panels.Count;
  BarStatic1.Width:=Width-500;
  SearchEdit.Width:=SearchPanel.Width-180;
  SearchBtn.Left:=SearchPanel.Width-90;
end;

procedure TfmAdrSp.SearchEditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key=#13 then SearchByFilter;
end;

procedure TfmAdrSp.SearchEditPropertiesChange(Sender: TObject);
begin
  if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    Timer1.Enabled:=True;
end;

procedure TfmAdrSp.Timer1Timer(Sender: TObject);
begin
// если в строке поиска до сих пор ничего нет, то показываем всё
  if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
    SearchByFilter;
  Timer1.Enabled:=False;
end;

procedure TfmAdrSp.SearchBtnClick(Sender: TObject);
begin
  if SpravParams.ShowMode=fsmSearchPlaceMode
  then pRegimeIsNormal := False;
  SearchByFilter;
end;

procedure TfmAdrSp.SearchEditFocusChanged(Sender: TObject);
begin
  if SearchEdit.Focused then
    DelA.ShortCut:=scNone
  else
    DelA.ShortCut:=$2E;  //i.e. Del
end;

procedure TfmAdrSp.MakeOldAExecute(Sender: TObject);
var pTableName:String;
begin
  if VarIsNull(DSetMain[Fields[0]]) then Exit;
  if (ZShowMessage(MakeOldA.Caption,'Чи ви справді бажаєте зробити застарілим запис "'+
           DSetMain[Fields[0]]+'"?'+#13+'Він більше не буде відображатися в довіднику.',
           mtConfirmation,[mbYes,mbNo]) = mrNo) then Exit;
  try
    StProc.StoredProcName:='ADR_MAKE_OBJECT_OLD';
    StProc.Transaction.StartTransaction;
    StProc.Prepare;
// Основываясь на названии ключевого поля, определяем название таблицы, заменяя ID_ на ADR_
    pTableName:=SpravParams.KeyField;
    Delete(pTableName,1,3);  // ID_
    Insert('ADR_',pTableName,1); // ADR_

    StProc.ParamByName('TABLE_NAME').AsString:=pTableName;
    StProc.ParamByName('ID_NAME').AsString:=SpravParams.KeyField;
    StProc.ParamByName('ID').AsInteger:=DSetMain[SpravParams.KeyField];
    StProc.ExecProc;
    StProc.Transaction.Commit;
    DSetMain.Close;
    DSetMain.Open;
    UseResult:=True;
  except on e: Exception do
    begin
      StProc.Transaction.Rollback;
      ZShowMessage('Помилка','Не вдалося відмітити запис як застарілий!'+#13+e.Message,mtError,[mbOK]);
    end;
  end;

end;

end.
