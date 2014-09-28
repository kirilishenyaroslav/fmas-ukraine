unit AddSch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxLabel, cxDropDownEdit, cxCalendar,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxMRUEdit,
  StdCtrls, cxButtons, ExtCtrls, MainSpSChClass, MainSpSchForm, Un_R_file_Alex, Un_lo_file_Alex, GlobalSPR,
  FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet;

type
  TfmAddMode = (Add , Change);

  TfmAddsch = class(TForm)
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxButtonAdd: TcxButton;
    cxButtonClose: TcxButton;
    cxMRUEditSch: TcxMRUEdit;
    cxDateBegin: TcxDateEdit;
    cxDateEnd: TcxDateEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    cxTextEditKod: TcxTextEdit;
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSetKodSys: TpFIBDataSet;
    procedure cxButtonCloseClick(Sender: TObject);
    procedure cxMRUEditSchPropertiesButtonClick(Sender: TObject);
    procedure cxButtonAddClick(Sender: TObject);
  private
    flag : TfmAddMode;
    myform : TfmForm;
    id : int64;
    id_jn_sch_jo : integer;
  public
    myclass : TSpRazdClass;
    constructor Create(AOwner: TComponent;DB: TpFIBDatabase; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddMode); reintroduce; overload;
  end;

implementation

//uses DB;


{$R *.dfm}

constructor TfmAddsch.Create(AOwner: TComponent;DB: TpFIBDatabase; mclass: TSpRazdClass; mform : TfmForm; m : TfmAddMode);
begin
    inherited Create (AOwner);
    myclass    := mclass;
    flag       := m;
    myform     := mform;

    Database                        := DB;

    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    StoredProc.DataBase             := Database;
    StoredProc.Transaction          := Transaction;

    DataSetKodSys.DataBase          := Database;
    DataSetKodSys.Transaction       := Transaction;

    Transaction.StartTransaction;


    if m = Add then
    begin
         Caption             := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxbuttonAdd.Caption := Un_R_file_Alex.J4_SP_RAZDELENIE_ADD_FORM_BUTTON_ADD;
         cxLabel1.Caption    := Un_R_file_Alex.J4_FIND_CAPTION_SCH;
         cxLabel2.Caption    := Un_R_file_Alex.J4_COLTITL_SCH_BEG;
         cxLabel3.Caption    := Un_R_file_Alex.J4_COLTITL_SCH_END;
    end;
    if m = change then
    begin
         Caption              := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_CAPTION;
         cxButtonAdd.Caption  := Un_R_file_Alex.J4_SP_RAZDELENIE_CHANGE_FORM_BUTTON_ADD;
         cxLabel1.Caption     := Un_R_file_Alex.J4_FIND_CAPTION_SCH;
         cxLabel2.Caption     := Un_R_file_Alex.J4_COLTITL_SCH_BEG_CHANGE;
         cxLabel3.Caption     := Un_R_file_Alex.J4_COLTITL_SCH_END_CHANGE;
         cxDateBegin.Date     := myform.DataSetSch.fbn('DATE_BEG').AsDateTime;
         cxDateEnd.date       := myform.DataSetSch.fbn('DATE_END').AsDateTime;
         cxMRUEditSch.Text    := myform.DataSetSch.fbn('SCH_TITLE').AsString;
         id                   := StrToInt64(myform.DataSetSch.fbn('ID_SCH').AsString);
         cxTextEditKod.Text   := myform.DataSetSch.fbn('KOD_SCH_AO').AsString;
         id_jn_sch_jo         := myform.DataSetSch.fbn('id_jn_jo_sch').AsInteger;
    end;
    cxButtonClose.Caption    := Un_R_file_Alex.MY_ACTION_CLOSE_CONST;

    DataSetKodSys.Close;
    DataSetKodSys.SQLs.SelectSQL.Text :='SELECT id_kod_sys from j4_ini';
    DataSetKodSys.Open;

end;

procedure TfmAddsch.cxButtonCloseClick(Sender: TObject);
begin
    close;
end;

procedure TfmAddsch.cxMRUEditSchPropertiesButtonClick(Sender: TObject);
var
    res : Variant;
begin
    res := GlobalSPR.GetSch(self, myform.Database.Handle, fsNormal, date, 1, DataSetKodSys.fbn('id_kod_sys').AsInteger, 0);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0][1]<>null) and (res[0][0]<>null) then
        begin
            id := res[0][0];
            cxMRUEditSch.Text := res[0][1];
        end;
    end;
end;

procedure TfmAddsch.cxButtonAddClick(Sender: TObject);
var
    iid : int64;
begin
    if (cxMRUEditSch.Text = '') or (cxDateBegin.Text = '') or (cxDateEnd.Text = '') then
         ShowMessage(Un_R_file_Alex.J4_ADD_VETKA_ERROR_MESS)
    else
    begin
        iid  := StrToInt64(myform.DataSetMain.fbn('ID_J4_SP_JO').AsString);
        if Flag = Add then
        begin
        Transaction.StartTransaction;
            try
              StoredProc.StoredProcName := 'J4_SP_SCH_SYSTEM_INSERT';

              StoredProc.Prepare;
              StoredProc.ParamByName('D_ID_SP_J4').AsInt64  := iid;
              StoredProc.ParamByName('D_ID_SCH').AsInt64    := id;
              StoredProc.ParamByName('D_DATE_BEGIN').AsDate := cxDateBegin.Date;
              StoredProc.ParamByName('D_DATE_END').AsDate   := cxDateEnd.Date;
              StoredProc.ParamByName('D_KOD_SCH').AsInteger := strtoint(cxTextEditKod.Text);

              StoredProc.ExecProc;

              Transaction.Commit;
              myform.ActionRefreshExecute(Sender);
              myform.DataSetMain.Locate('ID_J4_SP_JO', iid, []);
              close;
            except
              begin
                Transaction.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
              end;
            end;
        end;
        if Flag = Change then
        begin
        Transaction.StartTransaction;
            try
              StoredProc.StoredProcName := 'J4_SP_SCH_SYSTEM_UPDATE';

              StoredProc.Prepare;
              StoredProc.ParamByName('D_ID_SCH').AsInt64         := id;
              StoredProc.ParamByName('D_ID_J4_SP_JO').AsInt64       := iid;
              StoredProc.ParamByName('D_DATE_BEGIN').AsDate      := cxDateBegin.Date;
              StoredProc.ParamByName('D_DATE_END').AsDate        := cxDateEnd.Date;
              StoredProc.ParamByName('D_KOD_SCH').AsInteger      := strtoint(cxTextEditKod.Text);
              StoredProc.ParamByName('D_ID_JN_SCH_JO').AsInteger := id_jn_sch_jo;

              StoredProc.ExecProc;

              Transaction.Commit;
              myform.ActionRefreshExecute(Sender);
              myform.DataSetMain.Locate('ID_J4_SP_JO', iid, []);
              close;
            except
              begin
                Transaction.Rollback;
                Showmessage('При редагуванні виникла помилка');
                exit;
              end;
            end;
        end;
    end;

end;

end.
