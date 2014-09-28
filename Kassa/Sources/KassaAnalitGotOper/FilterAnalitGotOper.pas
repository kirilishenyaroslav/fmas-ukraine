unit FilterAnalitGotOper;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxLabel, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxControls, cxGroupBox, cxButtonEdit, FIBDatabase,
  pFIBDatabase, DB, FIBDataSet, pFIBDataSet, cxSpinEdit;

type
  TfmFilterAnalitGotOper = class(TForm)
    cxGroupBox1: TcxGroupBox;
    cxDateEdit1: TcxDateEdit;
    cxDateEdit2: TcxDateEdit;
    cxLabel2: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    cxRadioButton1: TcxRadioButton;
    cxRadioButton2: TcxRadioButton;
    cxRadioButton3: TcxRadioButton;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    Database: TpFIBDatabase;
    DataSetSch: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxLabel4: TcxLabel;
    cxComboBoxSch: TcxComboBox;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxComboBox1: TcxComboBox;
    cxSpinEdit1: TcxSpinEdit;
    cxGroupBox3: TcxGroupBox;
    cxButtonEdit3: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxRadioButton5Click(Sender: TObject);
    procedure cxRadioButton4Click(Sender: TObject);
    procedure cxSpinEdit1Click(Sender: TObject);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
  private
    IndKassa : array of Int64;
    pkv_kod, pkv_title, tfin_kod, tfin_title : string;
    id_pkv, id_tfin, id_user  : int64;
  public
    { Public declarations }
  end;

  function ShowFilterKassaAnalit(var d1, d2 : TDate; var pr : integer; DB : TpFIBDatabase; var id_s, id_pv, id_tf,id_us : int64; var pv_kod, pv_title, tf_kod, tf_title : string) : boolean;


implementation
uses Un_R_file_Alex, DateUtils, GlobalSpr;

{$R *.dfm}

function ShowFilterKassaAnalit(var d1, d2 : TDate; var pr : integer; DB : TpFIBDatabase; var id_s, id_pv, id_tf,id_us : int64; var pv_kod, pv_title, tf_kod, tf_title : string) : boolean;
var
    T : TfmFilterAnalitGotOper;
begin
    T  := TfmFilterAnalitGotOper.Create(nil);
    T.id_pkv                      := id_pv;
    T.id_tfin                     := id_tf;
    T.id_user                     := id_us;
    if id_pv > 0 then
    begin
        T.cxButtonEdit3.Text      := pv_kod + ' "' + pv_title + '"';
    end else
    begin
        T.cxButtonEdit3.Text      := '';
    end;
    if id_tf > 0 then
    begin
        T.cxButtonEdit2.Text      := tf_kod + ' "' + tf_title + '"';
    end else
    begin
        T.cxButtonEdit2.Text      := '';
    end;
    T.pkv_kod                     := pv_kod;
    T.pkv_title                   := pv_title;
    T.tfin_kod                    := tf_kod;
    T.tfin_title                  := tf_title;
    T.cxDateEdit1.Date            := d1;
    T.cxDateEdit2.Date            := d2;
    T.cxSpinEdit1.Value           := YearOf(d1);
    T.Database                    := DB;
    T.Transaction.DefaultDatabase := T.Database;
    T.Database.DefaultTransaction := T.Transaction;
    T.DataSetSch.Database         := T.Database;
    T.DataSetSch.Transaction      := T.Transaction;
    T.Transaction.StartTransaction;
    T.Caption                     := Un_R_file_Alex.KASSA_ANALITIC_FORM_CAPTION;
    T.cxRadioButton4.Caption      := Un_R_file_Alex.KASSA_CREATE_PO_MONTH;

    T.cxLabel2.Caption            := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxRadioButton5.Caption      := Un_R_file_Alex.KASSA_CREATE_DAY;
    T.cxRadioButton1.Caption      := Un_R_file_Alex.KASSA_ANALIT_KEKV;
    T.cxRadioButton2.Caption      := Un_R_file_Alex.KASSA_ANALIT_RAZD;
    T.cxRadioButton3.Caption      := Un_R_file_Alex.KASSA_ANAKIT_KEKV_RAZD;
    T.cxButton1.Caption           := Un_R_file_Alex.MY_BUTTON_FILTER + ' (Enter)';
    T.cxButton2.Caption           := Un_R_file_Alex.MY_EXIT;
    T.cxLabel4.Caption            := Un_R_file_Alex.KASSA_ANALITIC_PO_SCH;
    T.cxLabel1.Caption            := Un_R_file_Alex.KASSA_ANALIT_PROGRAMM;
    T.cxLabel3.Caption            := Un_R_file_Alex.KASSA_ANALIT_TYPE_KOSHTIV;

    T.cxComboBox1.Properties.Items.Insert(0, Un_R_file_Alex.MY_JANUARY);
    T.cxComboBox1.Properties.Items.Insert(1, Un_R_file_Alex.MY_FEBRIARY);
    T.cxComboBox1.Properties.Items.Insert(2, Un_R_file_Alex.MY_MARCH);
    T.cxComboBox1.Properties.Items.Insert(3, Un_R_file_Alex.MY_APRILE);
    T.cxComboBox1.Properties.Items.Insert(4, Un_R_file_Alex.MY_MAY);
    T.cxComboBox1.Properties.Items.Insert(5, Un_R_file_Alex.MY_JUNE);
    T.cxComboBox1.Properties.Items.Insert(6, Un_R_file_Alex.MY_JULY);
    T.cxComboBox1.Properties.Items.Insert(7, Un_R_file_Alex.MY_AUGUST);
    T.cxComboBox1.Properties.Items.Insert(8, Un_R_file_Alex.MY_SEPTEMBER);
    T.cxComboBox1.Properties.Items.Insert(9, Un_R_file_Alex.MY_OCTOBER);
    T.cxComboBox1.Properties.Items.Insert(10, Un_R_file_Alex.MY_NOVEMBER);
    T.cxComboBox1.Properties.Items.Insert(11, Un_R_file_Alex.MY_DESEMBER);

    T.cxComboBox1.ItemIndex  := MonthOf(d1)-1;

    T.DataSetSch.Close;
    T.DataSetSch.SQLs.SelectSQL.Text := 'SELECT * FROM KASSA_SELECT_ALL_SCHS('+IntToStr(id_us)+')';
    T.DataSetSch.Open;
    T.DataSetSch.FetchAll;

    SetLength(T.IndKassa, T.DataSetSch.RecordCount);
    T.DataSetSch.First;

    T.cxComboBoxSch.Properties.Items.Clear;
    while not T.DataSetSch.Eof do
    begin
        T.IndKassa[T.DataSetSch.RecNo - 1] := T.DataSetSch['ID_SCH'];
        T.cxComboBoxSch.Properties.Items.Insert(T.DataSetSch.RecNo - 1, T.DataSetSch['SCH_NUM']);
        T.DataSetSch.Next;
    end;

    T.cxComboBoxSch.ItemIndex := 0;


    if T.Showmodal = mrOk then
    begin
        if T.cxRadioButton4.Checked then
        begin
            if T.cxComboBox1.ItemIndex < 10
                then d1 := StrToDate('01.0'+IntTostr(T.cxComboBox1.ItemIndex+1)+'.'+IntToStr(T.cxSpinEdit1.Value))
                else d1 := StrToDate('01.'+IntTostr(T.cxComboBox1.ItemIndex+1)+'.'+IntToStr(T.cxSpinEdit1.Value));
            d2 := IncMonth(d1, 1);
        end else
        begin
            d1 := StrToDate(T.cxDateEdit1.Text);
            d2 := StrToDate(T.cxDateEdit2.Text);
        end;
        if T.cxRadioButton1.Checked then pr := 1;
        if T.cxRadioButton2.Checked then pr := 2;
        if T.cxRadioButton3.Checked then pr := 3;
        id_s     := T.IndKassa[T.cxComboBoxSch.ItemIndex];
        id_pv    := T.id_pkv;
        id_tf    := T.id_tfin;
        pv_kod   := T.pkv_kod;
        pv_title := T.pkv_title;
        tf_kod   := T.tfin_kod;
        tf_title := T.tfin_title;
        Result   := true;
    end else
    begin
        Result := false;
    end;
    T.Free;

end;

procedure TfmFilterAnalitGotOper.cxButton1Click(Sender: TObject);
var
    d1 : TDateTime;
begin
    try
        if (TryStrToDate(cxDateEdit1.Text, d1)) and (TryStrToDate(cxDateEdit2.Text, d1)) then
        begin
            if cxRadioButton4.Checked then
            begin
                if cxComboBox1.ItemIndex < 10
                    then d1 := StrToDate('01.0'+IntTostr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value))
                    else d1 := StrToDate('01.'+IntTostr(cxComboBox1.ItemIndex+1)+'.'+IntToStr(cxSpinEdit1.Value));
            end else
            begin
                d1 := StrToDate(cxDateEdit1.Text);
            end;
            DataSetSch.Close;
            DataSetSch.SQLs.SelectSQL.Text := 'SELECT OPEN_SCH FROM PUB_SP_MAIN_SCH_INFO('''+DateToStr(d1)+''', '+VarToStr(IndKassa[cxComboBoxSch.ItemIndex])+')';
            DataSetSch.Open;
            if d1 > DataSetSch.FieldByName('OPEN_SCH').AsDateTime then
            begin
                showmessage(Un_R_file_Alex.KASSA_ANALIT_DATE_SCH + dateToStr(d1));
                exit;
            end;
        end;
    except
    begin
        showmessage(Un_R_file_Alex.BANK_ERROR_DATE);
        exit;
    end;
    end;
    if id_pkv < 0 then
    begin
        showmessage(Un_R_file_Alex.KASSA_ANALIT_NO_PROGRAMM);
        cxButtonEdit3.SetFocus;
        exit;
    end;
    if id_tfin < 0 then
    begin
        showmessage(Un_R_file_Alex.KASSA_ANALIT_NOTYPE_KOSHTIV);
        cxButtonEdit2.SetFocus;
        exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmFilterAnalitGotOper.cxButton2Click(Sender: TObject);
begin
    close;
end;

procedure TfmFilterAnalitGotOper.cxRadioButton5Click(Sender: TObject);
begin
    if cxRadioButton5.Checked then
    begin
        cxDateEdit1.Enabled := true;
        cxDateEdit2.Enabled := true;
        cxComboBox1.Enabled := false;
    end;
end;

procedure TfmFilterAnalitGotOper.cxRadioButton4Click(Sender: TObject);
begin
    if cxRadioButton4.Checked then
    begin
        cxDateEdit1.Enabled := false;
        cxDateEdit2.Enabled := false;
        cxComboBox1.Enabled := true;
    end;
end;

procedure TfmFilterAnalitGotOper.cxSpinEdit1Click(Sender: TObject);
begin
    cxSpinEdit1.Value := StrToInt(cxSpinEdit1.Text);
end;

procedure TfmFilterAnalitGotOper.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res  : Variant;
begin
    Res := GlobalSpr.GetSmPKV(self, Database.Handle, fsNormal, -1);
    if (Res <> Variant(0)) then
    begin
        id_pkv                     := VarAsType(Res, varInt64);
        DataSetSch.Close;
        DataSetSch.SelectSQL.Text  := 'SELECT * FROM pub_sp_sm_pkv WHERE ID_PKV='+IntToStr(id_pkv);
        DataSetSch.Open;
        if (DataSetSch.RecordCount > 0) then
        begin
            pkv_kod                := DataSetSch.FieldByName('PKV_KOD').AsString;
            pkv_title              := DataSetSch.FieldByName('PKV_TITLE').AsString;
            cxButtonEdit3.Text     := pkv_kod+' "'+pkv_title+'"';
        end;
        DataSetSch.Close;
     end;
end;

procedure TfmFilterAnalitGotOper.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := GlobalSpr.GetTypeFinance(self, Database.Handle, fsNormal, -1);
    if ( Res <> Variant(0)) then
    begin
        id_tfin                   := VarAsType(Res,varInt64);
        DataSetSch.Close;
        DataSetSch.SelectSQL.Text  := 'SELECT * FROM pub_sp_type_finance WHERE ID_TYPE_FINANCE='+IntToStr(id_tfin);
        DataSetSch.Open;
        if (DataSetSch.RecordCount > 0) then
        begin
            tfin_kod              := DataSetSch.FieldByName('TYPE_FINANCE_CODE').AsString;
            tfin_title            := DataSetSch.FieldByName('TYPE_FINANCE_NAME').AsString;
            cxButtonEdit2.Text    := tfin_kod+' "'+tfin_title+'"';
        end;
        DataSetSch.Close;
    end;
end;

end.
