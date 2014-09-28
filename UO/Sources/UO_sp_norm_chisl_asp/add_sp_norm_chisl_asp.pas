unit add_sp_norm_chisl_asp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, main_sp_norm_chisl_asp, FIBDatabase, pFIBDatabase, cxMemo,
  cxTextEdit, cxLabel, cxControls, cxContainer, cxEdit, cxMaskEdit,
  cxButtonEdit, cxLookAndFeelPainters, StdCtrls, cxButtons, FIBQuery,
  pFIBQuery, pFIBStoredProc, DB, FIBDataSet, pFIBDataSet, ActnList;

type
  Tfmadd_sp_norm_chisl_asp = class(TForm)
    DB: TpFIBDatabase;
    TWr: TpFIBTransaction;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxTextEdit2: TcxTextEdit;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    SP: TpFIBStoredProc;
    DSave: TpFIBDataSet;
    ActionList1: TActionList;
    Action1: TAction;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure Action1Execute(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    myform : Tfmmain_sp_norm_chisl_asp;
    reg : smallint;
    ID_SP_FORM_OBUCH_KATEGORY, ID_SP_TYPE_KAT_STUD, ID : int64;
  public
    constructor Create(AO : TComponent; mform : Tfmmain_sp_norm_chisl_asp; regim : smallint); reintroduce; overload;
  end;

implementation
uses cn_Common_Loader,
     cn_Common_Types,
     uPrk_Loader,
     uPrK_Resources;

{$R *.dfm}

{ Tfmadd_sp_norm_chisl_stud }

constructor Tfmadd_sp_norm_chisl_asp.Create(AO: TComponent; mform: Tfmmain_sp_norm_chisl_asp; regim: smallint);
begin
    inherited Create(AO);
    myform              := mform;
    reg                 := regim;
    DB                  := myform.DB;
    TWr.DefaultDatabase := DB;

    if regim = 2 then
    begin
        ID_SP_FORM_OBUCH_KATEGORY := StrToInt64(myform.DS.fbn('ID_SP_FORM_OBUCH_KATEGORY').AsString);
        ID_SP_TYPE_KAT_STUD       := StrToInt64(myform.DS.fbn('ID_SP_TYPE_KAT_STUD').AsString);
        ID                        := StrToInt64(myform.DS.fbn('ID_SP_NORM_CHISL_ASP').AsString);

        cxButtonEdit1.Text        := myform.DS.fbn('NAME_KAT').AsString;
        cxButtonEdit2.Text        := myform.DS.fbn('NAME_OBUCH').AsString;
        cxTextEdit1.Text          := myform.DS.fbn('NORM_VAL').AsString;
        cxTextEdit2.Text          := myform.DS.fbn('NOTE').AsString;
    end;

    if regim = 3 then
    begin
        cxButtonEdit1.Text        := myform.DS.fbn('NAME_KAT').AsString;
        cxButtonEdit2.Text        := myform.DS.fbn('NAME_OBUCH').AsString;
        cxTextEdit1.Text          := myform.DS.fbn('NORM_VAL').AsString;
        cxTextEdit2.Text          := myform.DS.fbn('NOTE').AsString;

        Action1.Enabled           := false;
        cxButtonEdit1.Enabled     := false;
        cxButtonEdit2.Enabled     := false;
        cxTextEdit1.Enabled       := false;
        cxTextEdit2.Enabled       := false;
    end;
end;

procedure Tfmadd_sp_norm_chisl_asp.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmadd_sp_norm_chisl_asp.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : variant;
begin
    Res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PRK_SP_FORM_OBUCH_KATEGORY, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            ID_SP_FORM_OBUCH_KATEGORY  := Res[0];
            cxButtonEdit2.Text         := Res[1];
        end;
    end;
end;

procedure Tfmadd_sp_norm_chisl_asp.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : variant;
begin
    Res := uPrK_Loader.ShowPrkSprav(self, DB.Handle, PRK_SP_TYPE_KAT_STUD, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        if Res[0] <> Null then
        begin
            ID_SP_TYPE_KAT_STUD  := Res[0];
            cxButtonEdit1.Text   := Res[1];
        end;
    end;
end;

procedure Tfmadd_sp_norm_chisl_asp.Action1Execute(Sender: TObject);
begin
    if ID_SP_FORM_OBUCH_KATEGORY <= 0 then
    begin
        showmessage('Ви не вибрали категорію форми навчання!');
        cxButtonEdit2.SetFocus;
        exit;
    end;

    if ID_SP_TYPE_KAT_STUD <= 0 then
    begin
        showmessage('Ви не вибрали освітньо-кваліфікаційний рівень!');
        cxButtonEdit1.SetFocus;
        exit;
    end;

    if cxTextEdit1.Text = '' then
    begin
        showmessage('Ви не вказали норматив!');
        cxTextEdit1.SetFocus;
        exit;
    end;

    if reg = 1 then
    begin
         DSave.Database    := DB;
         DSave.Transaction := TWr;
         TWr.StartTransaction;
         try
             DSave.Close;
             DSave.SQLs.SelectSQL.Text := 'select * from UO_SP_NORM_CHISL_ASP_INSERT('+InttoStr(ID_SP_FORM_OBUCH_KATEGORY)+', '+InttoStr(ID_SP_TYPE_KAT_STUD)+', ''' + StringReplace(cxTextEdit1.Text,',','.',[]) + ''', '''+cxTextEdit2.Text+''', '+IntToStr(myform.id_user)+')';
             DSave.Open;
             id := StrToint64(DSave.fbn('ID_SP_NORM_CHISL_ASP').AsString);
             DSave.Close;
             TWr.Commit;
         except on E:Exception do begin
             TWr.Rollback;
             ShowMessage(E.Message);
             exit;
         end;
         end;
         myform.ARefreshExecute(Sender);
         myform.DS.Locate('ID_SP_NORM_CHISL_ASP', id, []);
    end;
    if reg = 2 then
    begin
        SP.Database         := DB;
        SP.Transaction      := TWr;
        try
            TWr.StartTransaction;
            SP.StoredProcName := 'UO_SP_NORM_CHISL_ASP_UPDATE';
            SP.ParamByName('ID_SP_NORM_CHISL_ASP').AsInt64  := id;
            SP.ParamByName('ID_SP_FORM_OBUCH_KATEGORY').AsInt64     := ID_SP_FORM_OBUCH_KATEGORY;
            SP.ParamByName('ID_SP_TYPE_KAT_STUD').AsInt64            := ID_SP_TYPE_KAT_STUD;
            SP.ParamByName('ID_USER').AsInt64                       := myform.id_user;
            SP.ParamByName('NORM_VAL').AsCurrency                   := StrToCurr(cxTextEdit1.Text);
            SP.ParamByName('NOTE').AsString                         := cxTextEdit2.text;
            SP.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
         myform.ARefreshExecute(Sender);
    end;
    Close;
end;

procedure Tfmadd_sp_norm_chisl_asp.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin

    if Ord(Key) = VK_TAB then exit;
    if Ord(Key) <> VK_TAB then
    begin
        cxTextEdit1.ClearSelection;
    end;

    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
        and (Key <> '-')
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEdit1.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEdit1.Text) - Pos(DecimalSeparator, cxTextEdit1.Text) > 1) and (Pos(DecimalSeparator, cxTextEdit1.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

end.
