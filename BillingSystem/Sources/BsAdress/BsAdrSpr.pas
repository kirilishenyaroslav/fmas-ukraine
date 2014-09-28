unit BsAdrSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, dxBar, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, dxBarExtItems, ActnList, ImgList, ExtCtrls,
  cxTextEdit, cxContainer, cxLabel, DmAdress, BaseTypes, pFIBDataSet, BsEditStreet,
  cxMaskEdit, cxDropDownEdit, iBase, pFIBDatabase, FIBDatabase, FIBDataSet,
  FIBQuery, pFIBQuery, pFIBStoredProc, AdrEdit;

type
  FormButton =  (fbAdd, fbModif, fbDelete, fbRefresh, fbSelect, fbExit);
  FormButtons = set of FormButton;

  TSpravParams = record
     SelectText:String;
     DeleteProcName:string;
     FormCaption:string;
     NameFields:string;
     ReturnFields:string;
     FieldsCaption:string;
     KeyField:Variant;
     FilterFields:string;
     FilterCaptions:string;
     DbHandle:TISC_DB_HANDLE;
     NameClass:string;
     AddInfo:Variant;
     frmButtons:FormButtons;
  end;

  TfrmSprav = class(TForm)
    SprGridDBView: TcxGridDBTableView;
    SprGridLevel: TcxGridLevel;
    SprGrid: TcxGrid;
    brManager: TdxBarManager;
    ImageList: TImageList;
    SprStyleRepository: TcxStyleRepository;
    ActionList1: TActionList;
    ActIns: TAction;
    ActEdit: TAction;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnClose: TdxBarLargeButton;
    ActDel: TAction;
    ActRefresh: TAction;
    ActSelect: TAction;
    ActClose: TAction;
    pnlFilter: TPanel;
    lblFilter: TcxLabel;
    FilterEdit: TcxTextEdit;
    sprFilterBox: TcxComboBox;
    SprDB: TpFIBDatabase;
    SprDSet: TpFIBDataSet;
    sReadTr: TpFIBTransaction;
    sWriteTr: TpFIBTransaction;
    SprDSource: TDataSource;
    SprStoredProc: TpFIBStoredProc;
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
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxGridTableViewStyleSheet1: TcxGridTableViewStyleSheet;
    procedure ActCloseExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActSelectExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure SprGridDBViewDblClick(Sender: TObject);
    procedure ActInsExecute(Sender: TObject);
    procedure FilterEditPropertiesChange(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure SprGridDBViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ActRefreshExecute(Sender: TObject);
  private
    { Private declarations }
     SpravParams:TSpravParams;
     strFields, strFieldsName, strReturnFields, strFilterFields, strFilterCaptions: array of string;
     NFields, NFieldsName, NReturnFields, NFilterFields : integer;
     //KeyValue:Variant;
  public
    { Public declarations }
    Res:Variant;
    constructor Create(AOwner:TComponent; SParams:TSpravParams);reintroduce;
    function GetFrmEdit(frmClass:string; var KeyFieldValue:Variant):Boolean;
  end;

var
  frmSprav: TfrmSprav;

implementation

{$R *.dfm}


constructor TfrmSprav.Create(AOwner:TComponent; SParams:TSpravParams);
var i, j:Integer;
    Col:TcxGridDBColumn;
begin
   try
      inherited Create(AOwner);
      SpravParams:=SParams;
      SprDB.Handle:=SpravParams.DbHandle;
      Caption:=SpravParams.FormCaption;
      if SprDSet.Active then SprDSet.Close;
      SprDSet.SQLs.SelectSQL.Text:=SpravParams.SelectText;
      //Готовим поля
      if Trim(SpravParams.NameFields)='' then NFields:=0
      else
      begin
         NFields:=1;
         SetLength(strFields,NFields);
         for i:=1 to Length(SpravParams.NameFields) do
         begin
           if SpravParams.NameFields[i]<>',' then
              strFields[NFields-1]:=strFields[NFields-1]+SpravParams.NameFields[i]
           else
           begin
              NFields:=NFields+1;
              SetLength(strFields, NFields);
           end;
         end;
      end;

      if Trim(SpravParams.FieldsCaption)='' then NFieldsName:=0
      else
      begin
         NFieldsName:=1;
         SetLength(strFieldsName,NFieldsName);
         for i:=1 to Length(SpravParams.FieldsCaption) do
         begin
           if SpravParams.FieldsCaption[i]<>'#' then
              strFieldsName[NFieldsName-1]:=strFieldsName[NFieldsName-1]+SpravParams.FieldsCaption[i]
           else
           begin
              NFieldsName:=NFieldsName+1;
              SetLength(strFieldsName, NFieldsName);
           end;
         end;
      end;

      if Trim(SpravParams.ReturnFields)='' then NReturnFields:=0
      else
      begin
         NReturnFields:=1;
         SetLength(strReturnFields,NReturnFields);
         for i:=1 to Length(SpravParams.ReturnFields) do
         begin
           if SpravParams.ReturnFields[i]<>',' then
              strReturnFields[NReturnFields-1]:=strReturnFields[NReturnFields-1]+SpravParams.ReturnFields[i]
           else
           begin
              NReturnFields:=NReturnFields+1;
              SetLength(strReturnFields, NReturnFields);
           end;
         end;
      end;

      if Trim(SpravParams.FilterFields)='' then NFilterFields:=0
      else
      begin
         NFilterFields:=1;
         SetLength(strFilterFields, NFilterFields);
         for i:=1 to Length(SParams.FilterFields) do
         begin
            if SpravParams.FilterFields[i]<>',' then
               strFilterFields[NFilterFields-1]:=strFilterFields[NFilterFields-1]+SpravParams.FilterFields[i]
            else
            begin
               NFilterFields:=NFilterFields+1;
               SetLength(strFilterFields, NFilterFields);
            end;
         end;
      end;
      i:=0;
      if Trim(SpravParams.FilterCaptions)<>'' then
      begin
         if NFilterFields>0 then
         begin
            SetLength(strFilterCaptions, NFilterFields);
            for j:=1 to Length(SpravParams.FilterCaptions) do
            begin
               if SpravParams.FilterCaptions[j]<>',' then
                  strFilterCaptions[i]:=strFilterCaptions[i]+SpravParams.FilterCaptions[j]
               else Inc(i);
            end;
         end;
      end;

      for i:=0 to NFilterFields-1 do
      begin
         sprFilterBox.Properties.Items.Add(strFilterCaptions[i]);
      end;
      if NFilterFields>0 then sprFilterBox.ItemIndex:=0;

      //Готовим грид
      SprGridDBView.OptionsView.CellAutoHeight:=true;
      SprGridDBView.OptionsView.HeaderAutoHeight:=true;
      SprGridDBView.OptionsView.ColumnAutoWidth:=true;

      for i:=0 to NReturnFields-1 do
      begin
         Col:=SprGridDBView.CreateColumn;
         Col.DataBinding.FieldName:=strReturnFields[i];
         //Col.sortOrder:=soAscending;
         Col.Options.Filtering:=false;
         Col.HeaderAlignmentHorz:=taCenter;
         Col.HeaderAlignmentVert:=vaCenter;
         Col.Caption:=strReturnFields[i];
         Col.Visible:=False;
         Col.Width:=SprGrid.Canvas.TextWidth(Col.Caption);
      end;
      
      for i:=0 to NFieldsName-1 do
      begin
        SprGridDBView.CreateColumn;
        SprGridDBView.Columns[i+NReturnFields].DataBinding.FieldName:=strFields[i];
        SprGridDBView.Columns[i+NReturnFields].Visible:=True;
        SprGridDBView.Columns[i+NReturnFields].Options.Filtering:=False;
        SprGridDBView.Columns[i+NReturnFields].HeaderAlignmentHorz:=taCenter;
        SprGridDBView.Columns[i+NReturnFields].HeaderAlignmentVert:=vaCenter;
        SprGridDBView.Columns[i+NReturnFields].Caption:=strFieldsName[i];
        SprGridDBView.Columns[i+NReturnFields].Width:=SprGrid.Canvas.TextWidth(SprGridDBView.Columns[i+NReturnFields].Caption);
      end;

      btnAdd.Enabled:=fbAdd in SpravParams.frmButtons;
      ActIns.Enabled:=btnAdd.Enabled;
      btnEdit.Enabled:=fbModif in SpravParams.frmButtons;
      ActEdit.Enabled:=btnEdit.Enabled;
      btnDel.Enabled:=fbDelete in SpravParams.frmButtons;
      ActDel.Enabled:=btnDel.Enabled;
      btnRefresh.Enabled:=fbRefresh in SpravParams.frmButtons;
      ActRefresh.Enabled:=btnRefresh.Enabled;
      btnSelect.Enabled:=fbSelect in SpravParams.frmButtons;
      ActSelect.Enabled:=btnRefresh.Enabled;
      btnClose.Enabled:=fbExit in SpravParams.frmButtons;
      ActClose.Enabled:=btnClose.Enabled;

      SprDSet.Open;
   except on E:Exception
          do begin
                agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
          end;
   end;
end;

function TfrmSprav.GetFrmEdit(frmClass:string; var KeyFieldValue:Variant):Boolean;
var ViewForm : TEditForm;
  	FClass: TPersistentClass;
begin
  ViewForm := nil;
  Result:=False;
  try
    FClass := GetClass(frmClass);

		if FClass <> nil then
      Application.CreateForm(TFormClass(FClass),ViewForm);
	except
    on E:Exception do
      begin
        agMessageDlg('Помилка',E.Message,mtError,[mbOK]);
      end;
	end;

  // проверяем, создалась форма или нет
	if ViewForm = nil then
   begin
      agMessageDlg('Помилка','Не вдалося створити вікно!',mtError,[mbOK]);
      Exit;
   end;

  ViewForm.SetParams(SprDB.Handle, KeyFieldValue, SpravParams.AddInfo);

  if ViewForm.ShowModal = mrOk then
  begin
     KeyFieldValue:=ViewForm.ReturnId;
     Result:=True;
  end;
  ViewForm.Release;
end;

procedure TfrmSprav.ActCloseExecute(Sender: TObject);
begin
   Close;
end;

procedure TfrmSprav.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   SprDSet.Close;
end;

procedure TfrmSprav.ActSelectExecute(Sender: TObject);
var i:Integer;
begin
   if SprDSet.IsEmpty then
   begin
      Exit;
      ModalResult:=mrCancel;
   end;
   Res:=VarArrayCreate([0, NReturnFields], varVariant);
   for i:=0 to NReturnFields-1 do
   begin
      Res[i]:=SprDSet.FieldValues[strReturnFields[i]];
   end;
   ModalResult:=mrOk;
end;

procedure TfrmSprav.ActDelExecute(Sender: TObject);
begin
  if SprDSet.IsEmpty then Exit;
  if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити запис?', mtConfirmation, [mbYes, mbNo])=mrNo then Exit;
  try
      SprStoredProc.Transaction.StartTransaction;
      SprStoredProc.StoredProcName:=SpravParams.DeleteProcName;
      SprStoredProc.Prepare;
      SprStoredProc.ParamByName(SpravParams.KeyField).AsVariant:=SprDSet[SpravParams.KeyField];
      SprStoredProc.ExecProc;
      SprStoredProc.Transaction.Commit;
      SprDSet.Close;
      SprDSet.Open;
  except on e: Exception do
    begin
      SprStoredProc.Transaction.Rollback;
      agMessageDlg('Увага!', e.Message, mtError,[mbOK]);
    end;  
  end;
end;

procedure TfrmSprav.SprGridDBViewDblClick(Sender: TObject);
begin
    ActSelectExecute(Sender);
end;

procedure TfrmSprav.ActInsExecute(Sender: TObject);
var KeyIdValue:Variant;
begin
   KeyIdValue:=null;
   if GetFrmEdit(SpravParams.NameClass, KeyIdValue) then
   begin
      SprDSet.Close;
      SprDSet.Open;
      SprDSet.Locate(SpravParams.KeyField, KeyIdValue, []);
   end;
end;

procedure TfrmSprav.FilterEditPropertiesChange(Sender: TObject);
begin
   if FilterEdit.Text='' then
   begin
      SprGridDBView.DataController.DataSet.Filtered:=False;
   end
   else
   begin
      SprGridDBView.DataController.DataSet.Filtered:=False;
      SprGridDBView.DataController.DataSet.Filter:= 'UPPER('+AnsiUpperCase(strFilterFields[sprFilterBox.ItemIndex])+') LIKE '''+'%'+
                                                     AnsiUpperCase(FilterEdit.Text) + '%'' and '+strFilterFields[sprFilterBox.ItemIndex]+' is not null';
      SprGridDBView.DataController.DataSet.Filtered:=True;
   end;
end;

procedure TfrmSprav.ActEditExecute(Sender: TObject);
var KeyIdValue:Variant;
begin
   If SprDSet.IsEmpty then Exit;
   KeyIdValue:=SprDSet[SpravParams.KeyField];
   if GetFrmEdit(SpravParams.NameClass, KeyIdValue) then
   begin
      SprDSet.Close;
      SprDSet.Open;
      SprDSet.Locate(SpravParams.KeyField, KeyIdValue, []);
   end
end;

procedure TfrmSprav.SprGridDBViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   //If 
end;

procedure TfrmSprav.ActRefreshExecute(Sender: TObject);
begin
   SprDSet.Close;
   SprDSet.Open;
end;

end.
