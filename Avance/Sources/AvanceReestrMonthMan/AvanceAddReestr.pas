unit AvanceAddReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AvanceReestrMain, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxLookAndFeelPainters, ImgList, cxMemo, cxSpinEdit, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxLabel, Un_R_file_Alex;

type
  TfmAddMode = (Add , Change);
  TfrmAvanceAddReestr = class(TForm)
    Database: TpFIBDatabase;
    Transaction: TpFIBTransaction;
    StoredProc: TpFIBStoredProc;
    DataSetNum: TpFIBDataSet;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    ButtonAdd: TcxButton;
    ButtonClose: TcxButton;
    GroupBox1: TGroupBox;
    TextEditNum: TcxTextEdit;
    cxMemo1: TcxMemo;
    ImageList: TImageList;
    cxTextEdit1: TcxTextEdit;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure s(Sender: TObject; var Key: Char);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    flag          : TfmAddMode;
    myform        : TfrmAvanceReestrMain;
    id_reestr     : int64;
    num_reestr    : integer;
  public
    constructor Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfrmAvanceReestrMain; m : TfmAddMode);
  end;

{var
  frmAvanceAddReestr: TfrmAvanceAddReestr;   }

implementation

{$R *.dfm}

constructor TfrmAvanceAddReestr.Create(AOwner: TComponent; db : TpFIBDatabase; mform : TfrmAvanceReestrMain; m : TfmAddMode);
begin
    inherited Create (AOwner);

    flag       := m;
    myform     := mform;

    Database                        := DB;

    Transaction.DefaultDatabase     := Database;
    Database.DefaultTransaction     := Transaction;

    DataSetNum.Database             := Database;
    DataSetNum.Transaction          := Transaction;

    StoredProc.DataBase             := Database;
    StoredProc.Transaction          := Transaction;

    Transaction.StartTransaction;

    cxTextEdit1.Text                := myform.prefix_reestr;
    DataSetNum.Close;
    DataSetNum.SQLs.SelectSQL.Text := 'select max(num_reestr) as num_reestr from J4_REESTR_MONTH where J4_REESTR_MONTH.date_reestr='''+datetostr(myform.date_beg_period)+'''';
    DataSetNum.Open;
    try num_reestr            := DataSetNum.FBN('num_reestr').AsInteger; except num_reestr := 0 end;
    TextEditNum.Text          := IntToStr(num_reestr+1);

    cxLabel1.Caption  := Un_R_file_Alex.J4_REESTR_NUM;
    cxLabel3.Caption := Un_R_file_Alex.J4_COMMENT;
    ButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;

    if m = Add then
    begin
         Caption             := Un_R_file_Alex.J4_FORM_REESTR_ADD;
         ButtonAdd.Caption   := Un_R_file_Alex.MY_ACTION_ADD_CONST;
    end;
    if m = change then
    begin
         Caption            := Un_R_file_Alex.J4_FORM_REESTR_EDIT;
         ButtonAdd.Caption  := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
         id_reestr          := myform.DataSetMainReestr.fbn('id_reestr_month').AsInteger;
         TextEditNum.Text   := myform.DataSetMainReestr.fbn('num_reestr').AsString;
         cxMemo1.Text       := myform.DataSetMainReestr.fbn('comment_reestr').AsString;
    end;
end;

procedure TfrmAvanceAddReestr.ButtonCloseClick(Sender: TObject);
begin
    close
end;

procedure TfrmAvanceAddReestr.ButtonAddClick(Sender: TObject);
var
    mes: string;
    flag_mes : boolean;
    date_beg_period : tdate;
    exist_num : integer;
begin
   if myform.cxComboBoxMonth.ItemIndex < 10 then
         date_beg_period := StrToDate('01.0'+IntTostr(myform.cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(myform.cxSpinEdit1.Value))
    else
         date_beg_period := StrToDate('01.'+IntTostr(myform.cxComboBoxMonth.ItemIndex+1)+'.'+IntToStr(myform.cxSpinEdit1.Value));

    mes := '';
    flag_mes := false;
    DecimalSeparator := ',';
    //проверка на корректность данных

    if TextEditNum.Text = '' then
    begin
        if not flag_mes then
        begin
            MES := Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        end else
            MES := mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_NUMBER;
        TextEditNum.style.Color := clred;
        FLAG_mes := TRUE;
    end else
        TextEditNum.style.Color := $00FFFBF0;


    if flag_mes then
    begin
        showmessage(mes + ' ' + Un_R_file_Alex.J4_ADD_WARNING_DONT_CREATE);
        exit;
    end;

    if Flag = Add then
    begin
            Transaction.StartTransaction;
            try
              StoredProc.StoredProcName := 'J4_REESTR_MONTH_INS';

              StoredProc.Prepare;
              StoredProc.ParamByName('num_reestr').AsInteger    := strtoint(TextEditNum.Text);
              StoredProc.ParamByName('comment_reestr').AsString := cxMemo1.Text;
              StoredProc.ParamByName('date_reestr').AsDate      := date_beg_period;
              StoredProc.ParamByName('id_user_add').AsInt64     := myform.id_user;
              StoredProc.ParamByName('id_jo').AsInt64           := myform.id_system;

              StoredProc.ExecProc;
              id_reestr                              := StoredProc.ParamByName('id_reestr_month').value;
              exist_num                              := StoredProc.ParamByName('exist_num').value;
              if(exist_num=1) then
              begin
                   showmessage(Un_R_file_Alex.J4_EXIST_NUMBER_REESTR);
                   Transaction.Rollback;
                   exit;
              end;
              Transaction.Commit;
              myform.ActionRefreshExecute(Sender);
              myform.DataSetMainReestr.Locate('ID_REESTR_MONTH', id_reestr, []);
              close;
            except
              begin
                Transaction.Rollback;
                Showmessage('При додаванні виникла помилка');
                exit;
              end;
            end;
            close;
    end;
    if Flag = Change then
    begin
        Transaction.StartTransaction;
        try
              StoredProc.StoredProcName := 'J4_REESTR_MONTH_UPD';


              StoredProc.Prepare;
              StoredProc.ParamByName('ID_REESTR_MONTH').AsInt64 := id_reestr;
              StoredProc.ParamByName('num_reestr').AsInteger    := strtoint(TextEditNum.Text);
              StoredProc.ParamByName('comment_reestr').AsString := cxMemo1.Text;
              StoredProc.ParamByName('date_reestr').AsDate      := date_beg_period;

              StoredProc.ExecProc;

              exist_num                              := StoredProc.ParamByName('exist_num').value;
              if((exist_num=1)and(myform.DataSetMainReestr.fbn('num_reestr').AsString<>TextEditNum.Text)) then
              begin
                   showmessage(Un_R_file_Alex.J4_EXIST_NUMBER_REESTR);
                   Transaction.Rollback;
                   exit;
              end;
              Transaction.Commit;
              myform.ActionRefreshExecute(Sender);
              myform.DataSetMainReestr.Locate('ID_REESTR_MONTH', id_reestr, []);
              close;
            except
          begin
            Transaction.Rollback;
            Showmessage('При редагуванні виникла помилка');
            exit;
          end;
    end;
        close;
    end;
end;

procedure TfrmAvanceAddReestr.s(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Ord(Key) <> VK_ESCAPE)
    then
        Key := Chr(0)
end;

procedure TfrmAvanceAddReestr.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

end.
