unit uSpEducOrg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, FIBQuery, pFIBQuery, pFIBStoredProc,
  FIBDataSet, pFIBDataSet, uEducationDataModule, dxBar, dxBarExtItems,
  ActnList, ImgList, cxTextEdit, cxContainer, cxLabel, cxMaskEdit,
  cxDropDownEdit, StdCtrls, iBase, BaseTypes, FIBDatabase, pFIBDatabase;

Const FiltersFields: Array[0..2] Of String = ('NAME_FULL', 'NAME_SHORT', 'TYPE_NAME');

type
  TfrmEducOrg = class(TForm)
    Panel1: TPanel;
    EducOrgGridDBTableView: TcxGridDBTableView;
    EducOrgGridLevel: TcxGridLevel;
    EducOrgGrid: TcxGrid;
    Panel2: TPanel;
    EducOrgGridDBTableViewDBColumn1: TcxGridDBColumn;
    EducOrgGridDBTableViewDBColumn2: TcxGridDBColumn;
    EducOrgGridDBTableViewDBColumn3: TcxGridDBColumn;
    EducOrgDSet: TpFIBDataSet;
    StorProc: TpFIBStoredProc;
    EducOrgDSource: TDataSource;
    dxBarManager1: TdxBarManager;
    btnAdd: TdxBarLargeButton;
    btnEdit: TdxBarLargeButton;
    btnDel: TdxBarLargeButton;
    btnRefresh: TdxBarLargeButton;
    btnSelect: TdxBarLargeButton;
    btnExit: TdxBarLargeButton;
    ActionList1: TActionList;
    ActAdd: TAction;
    ActEdit: TAction;
    ActDel: TAction;
    ActRefresh: TAction;
    ActSelect: TAction;
    ActExit: TAction;
    ImageList: TImageList;
    lblSearch: TcxLabel;
    SearchEdit: TcxTextEdit;
    cbSearchBox: TcxComboBox;
    cbLocFilter: TCheckBox;
    cbPanelGroup: TCheckBox;
    StyleRepository: TcxStyleRepository;
    stBackground: TcxStyle;
    stContent: TcxStyle;
    stContentEven: TcxStyle;
    stContentOdd: TcxStyle;
    stFilterBox: TcxStyle;
    stFooter: TcxStyle;
    stGroup: TcxStyle;
    stGroupByBox: TcxStyle;
    stHeader: TcxStyle;
    stInactive: TcxStyle;
    stIncSearch: TcxStyle;
    stIndicator: TcxStyle;
    stPreview: TcxStyle;
    stSelection: TcxStyle;
    stHotTrack: TcxStyle;
    qizzStyle: TcxGridTableViewStyleSheet;
    LocWriteTrans: TpFIBTransaction;
    procedure cbLocFilterClick(Sender: TObject);
    procedure cbPanelGroupClick(Sender: TObject);
    procedure ActAddExecute(Sender: TObject);
    procedure ActSelectExecute(Sender: TObject);
    procedure ActExitExecute(Sender: TObject);
    procedure ActEditExecute(Sender: TObject);
    procedure ActDelExecute(Sender: TObject);
    procedure ActRefreshExecute(Sender: TObject);
    procedure SearchEditPropertiesChange(Sender: TObject);
    procedure EducOrgGridDBTableViewDblClick(Sender: TObject);
  private
     HandleDB:TISC_DB_HANDLE;
     procedure EducOrgDSetCloseOpen;
    { Private declarations }
  public
    IdEducOrg:Integer;
    RetTextField:String;
    { Public declarations }
    constructor Create(AOwner:TComponent; HND:TISC_DB_HANDLE);
  end;

var
  frmEducOrg: TfrmEducOrg;

implementation

{$R *.dfm}

uses EducationUnit, U_SPEducOrg_Add;

constructor TfrmEducOrg.Create(AOwner:TComponent; HND:TISC_DB_HANDLE);
begin
   inherited Create(Aowner);
   HandleDB:=HND;
   EducOrgDSetCloseOpen;
   cbSearchBox.Properties.Items.Add('Повна назва');
   cbSearchBox.Properties.Items.Add('Скорочена назва');
   cbSearchBox.ItemIndex:=0;
end;

procedure TfrmEducOrg.EducOrgDSetCloseOpen;
begin
   EducOrgDSet.Close;
   EducOrgDSet.SQLs.SelectSQL.Text:='select distinct * '+
                                    'from asup_sp_educorg_select '+
                                    'order by name_full collate win1251_ua';
   EducOrgDSet.Open;
end;

procedure TfrmEducOrg.cbLocFilterClick(Sender: TObject);
var i:Integer;
begin
   for i:=0 to EducOrgGridDBTableView.ColumnCount-1 do
       EducOrgGridDBTableView.Columns[i].Options.Filtering:=cbLocFilter.Checked;
end;

procedure TfrmEducOrg.cbPanelGroupClick(Sender: TObject);
begin
   EducOrgGridDBTableView.OptionsView.GroupByBox:=cbPanelGroup.Checked;
end;

procedure TfrmEducOrg.ActAddExecute(Sender: TObject);
var frm:TfrmEducOrgAdd;
    RetId:Integer;
begin
    frm:=TfrmEducOrgAdd.Create(Self, HandleDB);
    if frm.ShowModal=mrOk then
    begin
        StorProc.StoredProcName:='ASUP_SP_EDUCORG_INSERT';
        StorProc.Transaction.StartTransaction;
        StorProc.Prepare;
        try
            StorProc.ParamByName('NAME_FULL').AsString:=frm.qFCC_FName.Value;
            StorProc.ParamByName('NAME_SHORT').AsString:=frm.qFCC_SName.Value;
            StorProc.ParamByName('ID_ADRESS').Value:=frm.qFSC_Adr.Value;
            StorProc.ParamByName('AKREDITATION').AsInteger:=frm.qFIC_Akred.Value;
            StorProc.ParamByName('IS_LEARNING').AsInteger:=Integer(frm.qFBC_IsEduc.Value);
            StorProc.ParamByName('IS_KVALIF').AsInteger:=Integer(frm.qFBC_IsKval.Value);
            StorProc.ParamByName('ID_TYPE').AsInteger:=frm.qFSC_type.Value;

            StorProc.ExecProc;
            RetId:=StorProc.FieldByName('ID').AsInteger;
            StorProc.Transaction.Commit;
        except on E:Exception
        do begin
            agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
            StorProc.Transaction.Rollback;
        end;
        end;
    end;
    EducOrgDSetCloseOpen;
    EducOrgDSet.Locate('ID_ORG', RetId, []);
    frm.Free;
end;

procedure TfrmEducOrg.ActSelectExecute(Sender: TObject);
begin
   if EducOrgDSet.IsEmpty then Exit;
   IdEducOrg:=EducOrgDSet['ID_ORG'];
   RetTextField:=EducOrgDSet['Name_Full'];
   ModalResult:=mrOk;
end;

procedure TfrmEducOrg.ActExitExecute(Sender: TObject);
begin
   ModalResult:=mrCancel;
end;

procedure TfrmEducOrg.ActEditExecute(Sender: TObject);
var frm:TfrmEducOrgAdd;
    Id:Integer;
begin
   if EducOrgDSet.IsEmpty then Exit;
   frm:=TfrmEducOrgAdd.Create(Self, HandleDB);
   frm.Caption:='Змінити навчальний заклад';
   Id:=EducOrgDSet['ID_ORG'];
   if VarIsNull(EducOrgDSet['NAME_FULL']) then frm.qFCC_FName.Value:=''
   else frm.qFCC_FName.Value:=EducOrgDSet['NAME_FULL'];
   if VarIsNull(EducOrgDSet['name_short']) then frm.qFCC_SName.Value:=''
   else frm.qFCC_SName.Value:=EducOrgDSet['name_short'];
   if Not VarIsNull(EducOrgDSet['ID_TYPE']) then
   begin
      frm.qFSC_type.Value:=EducOrgDSet['ID_TYPE'];
      frm.qFSC_type.DisplayText:=EducOrgDSet['TYPE_NAME'];
   end;
   if VarIsNull(EducOrgDSet['AKREDITATION']) then frm.qFIC_Akred.Value:=0
   else frm.qFIC_Akred.Value:=EducOrgDSet['AKREDITATION'];
   if VarIsNull(EducOrgDSet['IS_LEARNING']) then frm.qFBC_IsEduc.Value:=False
   else frm.qFBC_IsEduc.Value:=Boolean(EducOrgDSet['IS_LEARNING']);
   if VarIsNull(EducOrgDSet['IS_KVALIF']) then frm.qFBC_IsKval.Value:=False
   else frm.qFBC_IsKval.Value:=Boolean(EducOrgDSet['IS_KVALIF']);
   if frm.ShowModal=mrOk then
   begin
      StorProc.StoredProcName:='ASUP_SP_EDUCORG_UPDATE';
      StorProc.Transaction.StartTransaction;
      StorProc.Prepare;
      StorProc.ParamByName('NAME_FULL').AsString:=frm.qFCC_FName.Value;
      StorProc.ParamByName('NAME_SHORT').AsString:=frm.qFCC_SName.Value;
      StorProc.ParamByName('ID_ADRESS').Value:=frm.qFSC_Adr.Value;
      StorProc.ParamByName('AKREDITATION').AsInteger:=frm.qFIC_Akred.Value;
      StorProc.ParamByName('IS_LEARNING').AsInteger:=Integer(frm.qFBC_IsEduc.Value);
      StorProc.ParamByName('IS_KVALIF').AsInteger:=Integer(frm.qFBC_IsKval.Value);
      StorProc.ParamByName('ID_ORG').AsInteger:=Id;
      StorProc.ParamByName('ID_TYPE').AsInteger:=frm.qFSC_type.Value;
      try
        StorProc.ExecProc;
        StorProc.Transaction.Commit;
      except on E:Exception
             do begin
                   agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                   StorProc.Transaction.Rollback;
             end;
      end;
   end;
   EducOrgDSetCloseOpen;
   EducOrgDSet.Locate('ID_ORG', Id, []);
   frm.Free;
end;

procedure TfrmEducOrg.ActDelExecute(Sender: TObject);
var Id:Integer;
begin
   if EducOrgDSet.IsEmpty then Exit;
   Id:=EducOrgDSet['ID_ORG'];
   if agMessageDlg('Увага!', 'Ви дійсно бажаєте видалити цей запис?', mtConfirmation, [mbYes, mbNo])=mrYes then
   begin
       StorProc.StoredProcName:='SP_EDUCORG_DELETE';
       StorProc.Transaction.StartTransaction;
       StorProc.ParamByName('ID_ORG').AsInteger:=Id;
       try
          StorProc.ExecProc;
          StorProc.Transaction.Commit;
       except on e:Exception
              do begin
                    agMessageDlg('Увага!', E.Message, mtInformation, [mbOK]);
                    StorProc.Transaction.Rollback;
              end;
       end;
   end;
   EducOrgDSetCloseOpen;
   EducOrgDSet.Locate('ID_ORG', Id, []);
end;

procedure TfrmEducOrg.ActRefreshExecute(Sender: TObject);
begin
   EducOrgDSetCloseOpen;
end;

procedure TfrmEducOrg.SearchEditPropertiesChange(Sender: TObject);
var FltStr:string;
begin
   if (SearchEdit.Text = '') or (VarIsNull(SearchEdit.Text)) then
   begin
     EducOrgGridDBTableView.DataController.DataSet.Filtered := False;
   end
   else
   begin
    try
      EducOrgGridDBTableView.DataController.DataSet.Filtered := False;
      FltStr := 'UPPER('+AnsiUpperCase(FiltersFields[cbSearchBox.ItemIndex])+') LIKE ''' +
            '%'+AnsiUpperCase(SearchEdit.Text) + '%'' and '+FiltersFields[cbSearchBox.ItemIndex]+' is not null';
      EducOrgGridDBTableView.DataController.DataSet.Filter:=FltStr;
      EducOrgGridDBTableView.DataController.DataSet.Filtered := True;
      EducOrgGridDBTableView.DataController.SelectRows(0, 0);
    except on e:exception
           do showmessage(e.message);
    end;
   end;
end;

procedure TfrmEducOrg.EducOrgGridDBTableViewDblClick(Sender: TObject);
begin
   ActSelectExecute(Self);
end;

end.
