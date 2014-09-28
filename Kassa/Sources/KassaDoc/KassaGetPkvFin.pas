unit KassaGetPkvFin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, FIBDatabase, pFIBDatabase, DB,
  FIBDataSet, pFIBDataSet, cxLabel, cxContainer, cxEdit, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxControls, cxGroupBox, StdCtrls, cxButtons, KassaDocMainForm;

type
  TfmKassaGetPkvFin = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxGroupBox3: TcxGroupBox;
    cxButtonEdit3: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    Database: TpFIBDatabase;
    DataSetSch: TpFIBDataSet;
    Transaction: TpFIBTransaction;
    cxButtonEdit1: TcxButtonEdit;
    cxLabel2: TcxLabel;
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
  private
    myform : TfmKassaDocMainForm;
    pkv_kod, pkv_title, tfin_kod, tfin_title, kod_sch_kor_sdach,tytle_sch_kor_sdach : string;
    id_pkv, id_tfin,id_sch_kor_sdach  : int64;
  public
    date_doc : string;
    kod_sys  : variant;
  end;


  //fmKassaGetPkvFin: TfmKassaGetPkvFin;

function SelectPvkTypeFin(Owner : TComponent; m : TfmKassaDocMainForm; var id_sch, id_pv, id_tf : int64; var pv_kod, pv_title, tf_kod, tf_title, kod_sch, tytle_sch : string) : boolean;

implementation
uses Un_R_file_Alex, DateUtils, GlobalSpr;

{$R *.dfm}

function SelectPvkTypeFin(Owner : TComponent; m : TfmKassaDocMainForm;  var id_sch, id_pv, id_tf : int64; var pv_kod, pv_title, tf_kod, tf_title, kod_sch, tytle_sch : string) : boolean;
var
    T : TfmKassaGetPkvFin;
begin
    T  := TfmKassaGetPkvFin.Create(Owner);
    T.myform := m;
    T.Database.handle               := m.database.Handle;
    T.Database.Open;
    T.Caption                     := Un_R_file_Alex.KASSA_SEL_PKV_TF_SCH;
    T.cxLabel1.Caption            := Un_R_file_Alex.MY_COLTITL_SCH_TITLE;
    T.cxLabel3.Caption            := Un_R_file_Alex.KASSA_ANALIT_PROGRAMM;
    T.cxLabel2.Caption            := Un_R_file_Alex.KASSA_ANALIT_TYPE_KOSHTIV;
    T.cxButton1.Caption           := Un_R_file_Alex.MY_BUTTON_OK_CONST + ' (Enter)';
    T.cxButton2.Caption           := Un_R_file_Alex.MY_EXIT;

    T.id_pkv                     := id_pv;
    T.id_tfin                    := id_tf;
    T.id_sch_kor_sdach           := id_sch;

    T.date_doc := m.cxComboBoxDay.Text;
    T.kod_sys  :=m.DataSetKOdSys.FieldByName('ID_SYSTEM').AsVariant;

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

    if id_sch > 0 then
    begin
        T.cxButtonEdit1.Text      := kod_sch + ' "' + tytle_sch + '"';
    end else
    begin
        T.cxButtonEdit1.Text      := '';
    end;
    T.pkv_kod                     := pv_kod;
    T.pkv_title                   := pv_title;
    T.tfin_kod                    := tf_kod;
    T.tfin_title                  := tf_title;
    T.kod_sch_kor_sdach           := kod_sch;
    T.tytle_sch_kor_sdach         := tytle_sch;

    if T.ShowModal = mrOk then
    begin
        id_sch   := T.id_sch_kor_sdach;
        id_pv    := T.id_pkv;
        id_tf    := T.id_tfin;
        pv_kod   := T.pkv_kod;
        pv_title := T.pkv_title;
        tf_kod   := T.tfin_kod;
        tf_title := T.tfin_title;
        kod_sch  := T.kod_sch_kor_sdach;
        tytle_sch:= T.tytle_sch_kor_sdach;
        Result  := true;
    end
    else
        Result  := false;
    T.Free;
end;

procedure TfmKassaGetPkvFin.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res  : Variant;
begin
    Res := GlobalSpr.GetSmPKV(self, myform.Database.Handle, fsNormal, -1);
    if (Res <> Variant(0)) then
    begin
        id_pkv                     := VarAsType(Res, varInt64);
        if database.connected then
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

procedure TfmKassaGetPkvFin.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
    Res := GlobalSpr.GetTypeFinance(self, myform.Database.Handle, fsNormal, -1);
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

procedure TfmKassaGetPkvFin.cxButton1Click(Sender: TObject);
begin

    if cxButtonEdit1.Text = '' then
    begin
        showmessage(Un_R_file_Alex.KASSA_NOT_SEL_SCH);
        cxButtonEdit2.SetFocus;
        exit;
    end;
    if cxButtonEdit3.Text = '' then
    begin
        showmessage(Un_R_file_Alex.KASSA_ANALIT_NO_PROGRAMM);
        cxButtonEdit3.SetFocus;
        exit;
    end;
    if cxButtonEdit2.Text = '' then
    begin
        showmessage(Un_R_file_Alex.KASSA_ANALIT_NOTYPE_KOSHTIV);
        cxButtonEdit2.SetFocus;
        exit;
    end;
    ModalResult := mrOk;
end;

procedure TfmKassaGetPkvFin.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
        Res := GlobalSpr.GetSch(self, myform.Database.Handle, fsNormal, StrToDAte(date_doc), 1, kod_sys, -1);
        if VarArrayDimCount(Res)>0 then
        begin
            id_sch_kor_sdach    := Res[0][0];
            kod_sch_kor_sdach   := Res[0][3];
            tytle_sch_kor_sdach := Res[0][1];
            cxButtonEdit1.Text    := kod_sch_kor_sdach+' "'+tytle_sch_kor_sdach+'"';
        end;
end;

procedure TfmKassaGetPkvFin.cxButton2Click(Sender: TObject);
begin
    close;
end;

end.
