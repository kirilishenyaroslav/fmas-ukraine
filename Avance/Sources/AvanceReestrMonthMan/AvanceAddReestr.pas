unit AvanceAddReestr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, AvanceReestrMain, DB, FIBDataSet, pFIBDataSet, FIBQuery,
  pFIBQuery, pFIBStoredProc, FIBDatabase, pFIBDatabase,
  cxLookAndFeelPainters, ImgList, cxMemo, cxSpinEdit, cxMaskEdit,
  cxDropDownEdit, cxTextEdit, StdCtrls, cxButtons, cxControls, cxContainer,
  cxEdit, cxLabel, Un_R_file_Alex, cxButtonEdit, cxCheckBox,Un_lo_file_Alex;

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
    ButtonEditFioPrint: TcxButtonEdit;
    DS: TpFIBDataSet;
    DataSetSigns: TpFIBDataSet;
    cxLabel2: TcxLabel;
    procedure ButtonCloseClick(Sender: TObject);
    procedure ButtonAddClick(Sender: TObject);
    procedure s(Sender: TObject; var Key: Char);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ButtonEditFioCheckPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    flag          : TfmAddMode;
    myform        : TfrmAvanceReestrMain;
    id_reestr     : int64;
    num_reestr    : integer;
    ID_MAN_FOR_PRINT  : Int64;
    name_post_print: string;
    fio_small_print: string;
    fio_full_print: string;

    procedure Get_Fio_post(id_man :int64;
                           var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);

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
    DS.Database                     := Database;
    DS.Transaction                  := Transaction;
    DataSetSigns.Database           := Database;
    DataSetSigns.Transaction        := Transaction;

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
         DS.Close;
         DS.Sqls.SelectSQL.Text := 'select * from J4_INI';
         DS.Open;

         if DS['ID_MEN_CHECK']<>null then
          ID_MAN_FOR_PRINT   := strtoint64(DS.fbn('ID_MEN_CHECK').AsString)
         else
           ID_MAN_FOR_PRINT   := 0;
    end;

    if m = change then
    begin
         Caption            := Un_R_file_Alex.J4_FORM_REESTR_EDIT;
         ButtonAdd.Caption  := Un_R_file_Alex.MY_ACTION_UPDATE_CONST;
         id_reestr          := myform.DataSetMainReestr.fbn('id_reestr_month').AsInteger;
         TextEditNum.Text   := myform.DataSetMainReestr.fbn('num_reestr').AsString;
         cxMemo1.Text       := myform.DataSetMainReestr.fbn('comment_reestr').AsString;
         ID_MAN_FOR_PRINT   := strtoint64(myform.DataSetMainReestr.fbn('ID_MAN_FOR_PRINT').AsString)
    end;

    Get_Fio_post(ID_MAN_FOR_PRINT,name_post_print, fio_small_print,fio_full_print);
    ButtonEditFioPrint.Text := fio_full_print;
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
              StoredProc.ParamByName('ID_MAN_FOR_PRINT').AsInt64 := ID_MAN_FOR_PRINT;

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
              StoredProc.ParamByName('ID_MAN_FOR_PRINT').AsInt64 := ID_MAN_FOR_PRINT;
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

procedure TfrmAvanceAddReestr.ButtonEditFioCheckPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
    name_post, fio_small,fio_full : string;
begin
    res := Un_lo_file_Alex.MY_GetManEx(self, Database.Handle, false, false, ID_MAN_FOR_PRINT);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[0]<>null) and (res[1]<>null) then
        begin
            if ID_MAN_FOR_PRINT <> res[0] then
            begin
                ID_MAN_FOR_PRINT            := res[0];
                ButtonEditFioPrint.Text := res[1];
                Get_Fio_post(ID_MAN_FOR_PRINT,name_post, fio_small,fio_full);
                name_post_print    := name_post;
                fio_small_print    := fio_small;
                fio_full_print     := fio_full;
            end;
        end;
    end;
end;

procedure TfrmAvanceAddReestr.Get_Fio_post(id_man :int64; var name_post_out, fio_small_buhg_out,fio_full_buhg_out : string);
begin
    DataSetSigns.Close;
    DataSetSigns.SQLs.SelectSQL.Text := 'SELECT * FROM J4_GET_INFO_SIGN('+IntToStr(id_man)+','''+datetostr(date)+''')';
    DataSetSigns.Open;

    name_post_out          := DataSetSigns.FBN('name_post_buhg').AsString;
    fio_small_buhg_out     := DataSetSigns.FBN('fio_small_buhg').AsString;
    fio_full_buhg_out      := DataSetSigns.FBN('fio_full_buhg').AsString;

end;

end.
