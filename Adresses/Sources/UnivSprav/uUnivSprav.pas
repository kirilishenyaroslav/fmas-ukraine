unit uUnivSprav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, dxBar, dxBarExtItems,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  FIBDataSet, pFIBDataSet, FIBDatabase, pFIBDatabase, IBase, ActnList,
  ImgList, uFormControl, FIBQuery, pFIBQuery, RxMemDS, StdCtrls,
  cxContainer, cxCheckBox, cxTextEdit, cxMaskEdit, cxDropDownEdit;

type
  FormShowMode = (fsmShow, fsmSelect, fsmMSelect);
  FormButtons =  (fbAdd, fbModif, fbDelete, fbRefresh, fbSelect, fbExit);
  FormShowButtons = set of FormButtons;

  TUnivParams=Record
    FormCaption : string;
    ShowMode : FormShowMode;
    ShowButtons : FormShowButtons;
    Fields, FieldsName : string;
    KeyField : string;
    ReturnFields : string;
    AddFormClass, ModifFormClass : string;
    TableName : string;
    DeleteSQL : string;
    DBHandle : integer;
    AddParametrs : TRxMemoryData;
  end;

  TUnivSpravForm = class(TForm)
    UnivView: TcxGridDBTableView;
    cxG_MainLevel1: TcxGridLevel;
    cxG_Main: TcxGrid;
    dxBarDockControl1: TdxBarDockControl;
    dxBarManager1: TdxBarManager;
    dxBLB_Add: TdxBarLargeButton;
    dxBLB_Modif: TdxBarLargeButton;
    dxBLB_Del: TdxBarLargeButton;
    Panel1: TPanel;
    dxBarLargeButton4: TdxBarLargeButton;
    pFIBD_Main: TpFIBDatabase;
    pFIBT_Read: TpFIBTransaction;
    pFIBDS_Select: TpFIBDataSet;
    DS_Main: TDataSource;
    ImageList1: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    GridTableViewStyleSheetUserFormat3: TcxGridTableViewStyleSheet;
    ActionList1: TActionList;
    AddA: TAction;
    ModifA: TAction;
    DelA: TAction;
    OkA: TAction;
    CancelA: TAction;
    FilterA: TAction;
    RefreshA: TAction;
    dxBLB_Refresh: TdxBarLargeButton;
    dxBLB_Ok: TdxBarLargeButton;
    dxBarContainerItem1: TdxBarContainerItem;
    dxBarControlContainerItem1: TdxBarControlContainerItem;
    Panel2: TPanel;
    pFIBQ_Delete: TpFIBQuery;
    pFIBT_Write: TpFIBTransaction;
    Label1: TLabel;
    SearchEdit: TEdit;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxCB_FieldName: TcxComboBox;
    function GetEditForm(Mode: TFormMode; FormClass: string; var KeyValue: variant): Boolean;
    procedure AddAExecute(Sender: TObject);
    procedure ModifAExecute(Sender: TObject);
    procedure DelAExecute(Sender: TObject);
    procedure CancelAExecute(Sender: TObject);
    procedure RefreshAExecute(Sender: TObject);
    procedure FilterAExecute(Sender: TObject);
    procedure OkAExecute(Sender: TObject);
    procedure SearchEditChange(Sender: TObject);
    procedure UnivViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure UnivViewDblClick(Sender: TObject);
    procedure cxCheckBox1PropertiesChange(Sender: TObject);
    procedure cxCheckBox2PropertiesChange(Sender: TObject);
  private
    Fields, FieldsName, ReturnFields : array of string;
    NFields, NFieldsName, NReturnFields : integer;
  public
    SpravParams : TUnivParams;
    OutPut : TRxMemoryData;
    AddParametrs : TRxMemoryData;

    function PrepareForm(Params : TUnivParams) : boolean;

    { Public declarations }
  end;

function GetUnivSprav(Params : TUnivParams; var OutPut : TRxMemoryData):boolean;
procedure ShowInfo(DataSet: TDataSet);

implementation

uses uAddModifForm;

{$R *.dfm}

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i:integer;
begin
  text:='';
  for i:=1 to DataSet.Fields.Count do
   text:=text+DataSet.Fields[i-1].FieldName+' : '+DataSet.Fields[i-1].DisplayText+#13;
  ShowMessage(text);
end;

function GetUnivSprav(Params : TUnivParams; var OutPut : TRxMemoryData):boolean;
var form: TUnivSpravForm;
begin
  form:=TUnivSpravForm.Create(nil);
  form.OutPut:=TRxMemoryData.Create(form);
  if (form.PrepareForm(Params)) then
   if (Params.ShowMode=fsmSelect)or(Params.ShowMode=fsmMSelect) then
    begin
      form.UnivView.OptionsSelection.MultiSelect:=(Params.ShowMode=fsmMSelect);
      if (form.ShowModal=mrOk) then
       begin
         OutPut:=form.OutPut;
         result:=true;
       end
       else result:=false;
    end
    else begin  end;
end;

function TUnivSpravForm.PrepareForm(Params : TUnivParams) : boolean;
  var i,j,l: integer;
      Col:TcxGridDBColumn;
      OptStr: string;
begin
  try
    SpravParams:=Params;
    Caption:=SpravParams.FormCaption;

//Готовим базу
    pFIBD_Main.Handle:=TISC_DB_HANDLE(SpravParams.DBHandle);
    pFIBDS_Select.SelectSQL.Text:='select '+SpravParams.Fields+' from '+SpravParams.TableName;
    if (SpravParams.AddParametrs <> nil)
     then begin

     end;

    pFIBQ_Delete.SQL.Text:=SpravParams.DeleteSQL;

//Готовим поля
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
    UnivView.OptionsView.CellAutoHeight:=true;
    UnivView.OptionsView.HeaderAutoHeight:=true;
    UnivView.OptionsView.ColumnAutoWidth:=true;

    for i:=0 to NReturnFields-1 do
    begin
      Col:=UnivView.CreateColumn;
      Col.DataBinding.FieldName:=ReturnFields[i];
      Col.sortOrder:=soAscending;
      Col.Options.Filtering:=false;
      Col.HeaderAlignmentHorz:=taCenter;
      Col.HeaderAlignmentVert:=vaCenter;
      Col.Caption:=ReturnFields[i];
      Col.Visible:=False;
      Col.Width:=cxG_Main.Canvas.TextWidth(Col.Caption);
    end;

    j:=-1;
    for i:=0 to NFieldsName-1 do
    begin
      UnivView.CreateColumn;
      UnivView.Columns[i+NReturnFields].DataBinding.FieldName:=Fields[i];
      UnivView.Columns[i+NReturnFields].Visible:=True;
      if FieldsName[i][1]='~' then
       begin
         j:=j+1;
         UnivView.Columns[i+NReturnFields].GroupIndex:=j;

         if FieldsName[i][2]='*' then
          begin
            UnivView.Columns[i+NReturnFields].Visible:=False;
            FieldsName[i][2]:=' ';
          end;

         FieldsName[i][1]:=' ';
       end;
      UnivView.Columns[i+NReturnFields].sortOrder:=soAscending;
      UnivView.Columns[i+NReturnFields].Options.Filtering:=false;
      UnivView.Columns[i+NReturnFields].HeaderAlignmentHorz:=taCenter;
      UnivView.Columns[i+NReturnFields].HeaderAlignmentVert:=vaCenter;
      if FieldsName[i][1]='('
       then begin
         OptStr:='';
         l:=2;
         while ((FieldsName[i][l]<>')')and(l<Length(FieldsName[i]))) do
         begin
           OptStr:=OptStr+FieldsName[i][l];
           l:=l+1;
         end;
         if (FieldsName[i][l]=')')
          then begin
            Delete(FieldsName[i],1,l);
            for l:=1 to Length(OptStr) do
              case OptStr[l] of
                '~': begin
                       j:=j+1;
                       UnivView.Columns[i+NReturnFields].GroupIndex:=j;
                     end;
                '*': UnivView.Columns[i+NReturnFields].Visible:=False;
                '>': UnivView.Columns[i+NReturnFields].sortOrder:=soDescending;
                '<': UnivView.Columns[i+NReturnFields].sortOrder:=soAscending;
                's','S' : UnivView.Columns[i+NReturnFields].Options.IncSearch:=True;
              end;
          end;
       end;
      cxCB_FieldName.Properties.Items.Add(FieldsName[i]);
      UnivView.Columns[i+NReturnFields].Caption:=FieldsName[i];
      UnivView.Columns[i+NReturnFields].Width:=cxG_Main.Canvas.TextWidth(UnivView.Columns[i+NReturnFields].Caption);
    end;

    //Готовим кнопки
    AddA.Enabled:=fbAdd in SpravParams.ShowButtons;
    ModifA.Enabled:=fbModif in SpravParams.ShowButtons;
    DelA.Enabled:=fbDelete in SpravParams.ShowButtons;
    OkA.Enabled:=(fbSelect in SpravParams.ShowButtons)or(SpravParams.ShowMode=fsmSelect)or(SpravParams.ShowMode=fsmMSelect);
    CancelA.Enabled:=fbExit in SpravParams.ShowButtons;

    pFIBDS_Select.Open;
    Result:=True;
    cxCB_FieldName.ItemIndex:=0;
  except on e: Exception do
    begin
      ShowMessage(e.Message);
      Result:=False;
    end;
  end;
end;

function TUnivSpravForm.GetEditForm(Mode: TFormMode; FormClass: string; var KeyValue: variant): Boolean;
var form : TForm;
  	fclass: TPersistentClass;
    FormControl: TqFFormControl;
    i: Integer;
    res: Boolean;
begin
  form := nil;
  Result:=False;
  try
    fclass := GetClass(FormClass);

		if fclass <> nil then
		 Application.CreateForm(TFormClass(fclass),form);
	except
	end;

  // проверить, создалась она или нет
	if form = nil then
    begin
        ShowMessage('Не удалось создать форму добавления!');
        Exit;
    end;

  // найти управляющий элемент формы
  FormControl := nil;
  for i:=0 to form.ComponentCount-1 do
    if form.Components[i] is TqFFormControl then
     begin
       FormControl := form.Components[i] as TqFFormControl;
       break;
     end;

  // найти переменную с хенделом базы
  (form as TAddModifForm).DBHandle:= Integer(pFIBD_Main.Handle);

    if (SpravParams.AddParametrs <> nil)
     then begin
       (form as TAddModifForm).AddParametrs:=SpravParams.AddParametrs;
     end;

  // подготовить форму
  if FormControl <> nil then
   begin
     res := FormControl.Prepare(pFIBD_Main, Mode, KeyValue, null);
     if not res then
      begin
        form.Free;
        Exit;
      end;
   end;

  if form.ShowModal = mrOk then
   begin
     // получить, какую запись добавили
     if ( ( Mode = fmAdd ) or ( Mode = fmClone) ) and ( FormControl <>  nil )
      then KeyValue := FormControl.LastId;

     Result:=True;

     pFIBDS_Select.Close;
     pFIBDS_Select.Open;
     pFIBDS_Select.Locate(SpravParams.KeyField,KeyValue,[]);

     // обновить список
   end;
  form.Free;
end;

procedure TUnivSpravForm.AddAExecute(Sender: TObject);
var KeyValue : variant;
begin
  KeyValue:=null;
  if GetEditForm(fmAdd,SpravParams.AddFormClass,KeyValue) then
   begin
     pFIBDS_Select.Close;
     pFIBDS_Select.Open;
     pFIBDS_Select.Locate(SpravParams.KeyField,KeyValue,[]);
   end;
end;

procedure TUnivSpravForm.ModifAExecute(Sender: TObject);
var KeyValue : variant;
begin
  KeyValue:=pFIBDS_Select[SpravParams.KeyField];
  if GetEditForm(fmModify,SpravParams.AddFormClass,KeyValue) then
   begin
     pFIBDS_Select.Close;
     pFIBDS_Select.Open;
     pFIBDS_Select.Locate(SpravParams.KeyField,KeyValue,[]);
   end;
end;

procedure TUnivSpravForm.DelAExecute(Sender: TObject);
begin
  if (MessageDlg('Чи ви справді бажаєте вилучити запис "'+
           pFIBDS_Select[Fields[0]]+'"?',mtConfirmation,[mbYes,mbNo],0) = mrNo) then Exit;
  try
    pFIBQ_Delete.Transaction.StartTransaction;
    pFIBQ_Delete.ParamByName(SpravParams.KeyField).AsVariant:=pFIBDS_Select[SpravParams.KeyField];
//    ShowMessage(IntToStr(pFIBQ_Delete.ParamByName(SpravParams.KeyField).AsVariant));
    pFIBQ_Delete.ExecProc;
    pFIBQ_Delete.Transaction.Commit;
    pFIBDS_Select.Close;
    pFIBDS_Select.Open;
  except on e: Exception do
    begin
      pFIBQ_Delete.Transaction.Rollback;
      MessageDlg('Не вдалося вилучити запис!'+#13+e.Message,mtError,[mbYes],0);
    end;  
  end;
end;

procedure TUnivSpravForm.CancelAExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TUnivSpravForm.RefreshAExecute(Sender: TObject);
var val:Variant;
begin
  val:=pFIBDS_Select[SpravParams.KeyField];
  pFIBDS_Select.Close;
  pFIBDS_Select.Open;
  pFIBDS_Select.Locate(SpravParams.KeyField,val,[]);
end;

procedure TUnivSpravForm.FilterAExecute(Sender: TObject);
begin
    //
end;

procedure TUnivSpravForm.OkAExecute(Sender: TObject);
var i,j,count:integer;
begin
  if (pFIBDS_Select.IsEmpty) then
   begin
     ModalResult:=0;
     Exit;
   end;
  for i:=1 to NReturnFields do
    Output.FieldDefs.Add(ReturnFields[i-1], ftVariant);

  Output.Open;
  if (UnivView.OptionsSelection.MultiSelect) then
   begin
     count:=UnivView.Controller.SelectedRowCount;
     for i:=0 to count-1 do
     begin
       Output.Append;
       for j:=0 to NReturnFields-1 do
         Output[ReturnFields[j]] := UnivView.Controller.SelectedRecords[i].Values[j];
       Output.Post;
     end;
   end
  else
   begin
     Output.Append;
       for j:=0 to NReturnFields-1 do
         Output[ReturnFields[j]] := UnivView.Controller.SelectedRecords[0].Values[j];
     Output.Post;
   end;
  ModalResult:=mrOk;
end;

procedure TUnivSpravForm.SearchEditChange(Sender: TObject);
begin
  if (SearchEdit.Text = '')or(VarIsNull(SearchEdit.Text)) then
   begin
     UnivView.DataController.DataSet.Filtered := False;
   end
  else
   begin
     try
       UnivView.DataController.DataSet.Filtered := False;
       UnivView.DataController.DataSet.Filter := 'UPPER('+
            AnsiUpperCase(Fields[cxCB_FieldName.ItemIndex])+') LIKE ''' +
            AnsiUpperCase(SearchEdit.Text) + '%'' and '+Fields[0]+' is not null';
       UnivView.DataController.DataSet.Filtered := True;
       UnivView.ViewData.Expand(False);
     except
     end;
    end;
end;

procedure TUnivSpravForm.UnivViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_F12) and (ssShift in Shift) then
   ShowInfo(UnivView.DataController.DataSource.DataSet);
end;

procedure TUnivSpravForm.UnivViewDblClick(Sender: TObject);
begin
  if (OkA.Enabled) then OkA.Execute;
end;

procedure TUnivSpravForm.cxCheckBox1PropertiesChange(Sender: TObject);
var i:Integer;
begin
     for i:=0 to UnivView.ColumnCount-1 do
     begin
          UnivView.Columns[i].Options.Filtering:=cxCheckBox1.Checked;
     end;
end;

procedure TUnivSpravForm.cxCheckBox2PropertiesChange(Sender: TObject);
begin
  UnivView.OptionsView.GroupByBox:=cxCheckBox2.Checked;
end;

end.
