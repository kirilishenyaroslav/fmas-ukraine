unit MainFinFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Ibase, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, pFibStoredProc,
  StdCtrls, ExtCtrls;

type
  TfrmFinForms = class(TForm)
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    cxStyle1: TcxStyle;
    SmallImages: TImageList;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton7: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    FrmTypesDataSet: TpFIBDataSet;
    FrmTypeDataSource: TDataSource;
    FormsDataSet: TpFIBDataSet;
    FormsDataSource: TDataSource;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Panel1: TPanel;
    Label1: TLabel;
    cbYearBeg: TComboBox;
    procedure AddButtonClick(Sender: TObject);
    procedure UpdateButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DelButtonClick(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure cbYearBegChange(Sender: TObject);
  private
    { Private declarations }
    MBookDate:TDateTime;
  public
    { Public declarations }
    id_user:int64;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);reintroduce;
  end;

  procedure GetFinForms(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);stdcall;
  exports GetFinForms;

implementation

uses FinFrmEdit, cxDBLookupComboBox, BaseTypes, dateUtils, FinFrmObj, UFrmResults,
     Resources_unitb,  GlobalSpr;

{$R *.dfm}

procedure GetFinForms(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;id_user:Int64);
var f:Boolean;
    i:Integer;
begin
    f :=true;
    for i:=0 to Application.MainForm.MDIChildCount-1 do
    begin
         if (Application.MainForm.MDIChildren[i] is TfrmFinForms)
         then begin
                   Application.MainForm.MDIChildren[i].BringToFront;
                   f:=false;
         end;
    end;
    if f then TfrmFinForms.Create(AOwner,DBHandle,id_user);
end;


constructor TfrmFinForms.Create(AOwner: TComponent; DBHandle: TISC_DB_HANDLE; id_user: Int64);
var SysDS:TpFibDataSet;
    I:Integer;
begin
    inherited Create(AOwner);
    self.id_user:=id_user;
    WorkDatabase.Handle:=DBHandle;
    ReadTransaction.StartTransaction;

    FrmTypesDataSet.SelectSQL.Text:='SELECT * FROM FINANCE_SP_TYPE_FORM';
    FrmTypesDataSet.Open;
    FrmTypesDataSet.FetchAll;

    SysDS:=TpFibDataSet.Create(self);
    SysDS.Database:=WorkDatabase;
    SysDS.Transaction:=ReadTransaction;
    SysDS.SelectSQL.Text:='SELECT * FROM PUB_SYS_DATA';
    SysDS.Open;
    if (SysDS.RecordCount>0)
    then begin
              MBookDate:=SysDS.FieldByName('MAIN_BOOK_DATE').Value;
    end;
    SysDS.Free;

    for i:=0 to YEARS_COUNT do
    begin
          cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
    end;

    for i:=0 to cbYearBeg.Items.Count-1 do
    begin
           if pos(cbYearBeg.Items[i],IntToStr(YearOf(MBookDate)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
    end;

    FormsDataSet.SelectSQL.Text:='SELECT * FROM FINANCE_DT_FORMS_SELECT WHERE EXTRACTYEAR(DATE_BEG)>='+cbYearBeg.Items[cbYearBeg.ItemIndex];
    FormsDataSet.Open;
end;

procedure TfrmFinForms.AddButtonClick(Sender: TObject);
var
    T:TfrmEditFinFrm;
    InsertSP:TpFibStoredProc;
    Id_form:Integer;
begin
    T:=TfrmEditFinFrm.Create(self);
    if T.ShowModal=mrYes
    then begin
              InsertSP:=TpFibStoredProc.Create(self);
              InsertSP.Database:=WorkDatabase;
              InsertSP.Transaction:=WriteTransaction;
              WriteTransaction.StartTransaction;
              InsertSP.StoredProcName:='FINANCE_DT_FORMS_INSERT';
              InsertSP.Prepare;
              InsertSP.ParamByName('FORM_TITLE').Value  :=T.EdFormTitle.Text;
              InsertSP.ParamByName('ID_FORM_TYPE').Value:=T.cbTypeForm.EditValue;
              if T.cxCheckBox1.Checked
              then InsertSP.ParamByName('DATE_BEG').Value    :=EncodeDate(StrToInt(T.cbYearBeg.Text),T.cbMonthBeg.ItemIndex+1,1)
              else InsertSP.ParamByName('DATE_BEG').Value    :=EncodeDate(StrToInt(T.cbYearBeg.Text),1,1);
              InsertSP.ExecProc;
              Id_form:=InsertSP.FieldByName('ID_FORM').AsInteger;
              WriteTransaction.Commit;
              InsertSP.Free;
              FormsDataSet.CloseOpen(true);
              FormsDataSet.Locate('ID_FORM',id_form,[]);
    end;
    T.Free;
end;

procedure TfrmFinForms.UpdateButtonClick(Sender: TObject);
var
    T:TfrmEditFinFrm;
    UpdateSP:TpFibStoredProc;
    id_form:Integer;
begin
    if (FormsDataSet.RecordCount>0)
    then begin
              T:=TfrmEditFinFrm.Create(self);

              T.EdFormTitle.Text    :=FormsDataSet.FieldByName('FORM_TITLE').AsString;
              T.cbTypeForm.EditValue:=FormsDataSet.FieldByName('ID_FORM_TYPE').AsString;
              T.cbYearBeg.Text     :=IntToStr(YearOf(FormsDataSet.FieldByName('DATE_BEG').AsDateTime));
              if T.ShowModal=mrYes
              then begin
                        UpdateSP:=TpFibStoredProc.Create(self);
                        UpdateSP.Database:=WorkDatabase;
                        UpdateSP.Transaction:=WriteTransaction;
                        WriteTransaction.StartTransaction;
                        UpdateSP.StoredProcName:='FINANCE_DT_FORMS_UPDATE';
                        UpdateSP.Prepare;
                        id_form:=FormsDataSet.FieldByName('ID_FORM').Value;
                        UpdateSP.ParamByName('ID_FORM').AsInteger :=FormsDataSet.FieldByName('ID_FORM').Value;
                        UpdateSP.ParamByName('FORM_TITLE').Value  :=T.EdFormTitle.Text;
                        UpdateSP.ParamByName('ID_FORM_TYPE').Value:=T.cbTypeForm.EditValue;

                        if T.cxCheckBox1.Checked
                        then UpdateSP.ParamByName('DATE_BEG').Value    :=EncodeDate(StrToInt(T.cbYearBeg.Text),T.cbMonthBeg.ItemIndex+1,1)
                        else UpdateSP.ParamByName('DATE_BEG').Value    :=EncodeDate(StrToInt(T.cbYearBeg.Text),1,1);

                        UpdateSP.ExecProc;

                        WriteTransaction.Commit;
                        UpdateSP.Free;
                        FormsDataSet.CloseOpen(true);
                        FormsDataSet.Locate('ID_FORM',id_form,[]);

              end;
              T.Free;
    end;
end;

procedure TfrmFinForms.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
    Action:=caFree;
end;

procedure TfrmFinForms.DelButtonClick(Sender: TObject);
var DeleteSP:TpFibStoredProc;
begin
    if BaseTypes.agMessageDlg('Увага!','Ви хочете видалити форму звітності?',mtConfirmation,[mbYes,mbNo])=idYes
    then begin
                if (FormsDataSet.RecordCount>0)
                then begin
                          DeleteSP:=TpFibStoredProc.Create(self);
                          DeleteSP.Database:=WorkDatabase;
                          DeleteSP.Transaction:=WriteTransaction;
                          WriteTransaction.StartTransaction;
                          DeleteSP.StoredProcName:='FINANCE_DT_FORMS_DELETE';
                          DeleteSP.Prepare;
                          DeleteSP.ParamByName('ID_FORM').AsInteger :=FormsDataSet.FieldByName('ID_FORM').Value;
                          DeleteSP.ExecProc;
                          WriteTransaction.Commit;
                          DeleteSP.Free;
                          FormsDataSet.CacheDelete;
                end;
    end;
end;

procedure TfrmFinForms.ToolButton7Click(Sender: TObject);
var id_form:integer;
begin
     id_form:=0;

     if (FormsDataSet.RecordCount>0)
     then id_form:=FormsDataSet.FieldByName('ID_FORM').Value;

     FormsDataSet.Close;

     FormsDataSet.SelectSQL.Text:='SELECT * FROM FINANCE_DT_FORMS_SELECT WHERE EXTRACTYEAR(DATE_BEG)>='+cbYearBeg.Items[cbYearBeg.ItemIndex];

     FormsDataSet.Open;

     FormsDataSet.Locate('ID_FORM',id_form,[]);
end;

procedure TfrmFinForms.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TfrmFinForms.ToolButton1Click(Sender: TObject);
  var T:TfrmFinObj;
begin
      T:=TfrmFinObj.Create(self);
      T.ShowModal;
      T.Free;
end;

procedure TfrmFinForms.ToolButton3Click(Sender: TObject);
var f:Boolean;
    I:Integer;
begin
      if (FormsDataSet.RecordCount>0)
      then begin
                 f:=true;
                 for i:=0 to Application.MainForm.MDIChildCount-1 do
                 begin
                       if (Application.MainForm.MDIChildren[i] is TfrmFrmResults)
                       then begin
                                 if TfrmFrmResults(Application.MainForm.MDIChildren[i]).id_form=StrToInt64(FormsDataSet.FieldByName('ID_FORM').AsString)
                                 then begin
                                           Application.MainForm.MDIChildren[i].BringToFront;
                                           f:=false;
                                 end;
                       end;
                end;
                if f
                then begin
                          TfrmFrmResults.Create(self,
                                                 FormsDataSet.FieldByName('DATE_BEG').AsDateTime,
                                                 StrToInt64(FormsDataSet.FieldByName('ID_FORM').AsString),
                                                 WorkDatabase.handle);
                end;
      end;
end;

procedure TfrmFinForms.cbYearBegChange(Sender: TObject);
begin
     ToolButton7Click(Self);
end;

end.


