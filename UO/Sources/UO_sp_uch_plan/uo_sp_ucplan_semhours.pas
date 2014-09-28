unit uo_sp_ucplan_semhours;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxTextEdit, cxMaskEdit, cxButtonEdit, cxControls, cxContainer,
  cxEdit, cxLabel, cxLookAndFeelPainters, StdCtrls, cxButtons, uo_sp_uchplan_add,
  ActnList;

type
  Tfmuo_sp_ucplan_semhours = class(TForm)
    cxLabel1: TcxLabel;
    cxButtonEdit1: TcxButtonEdit;
    cxButtonEdit2: TcxButtonEdit;
    cxLabel2: TcxLabel;
    cxButtonEdit3: TcxButtonEdit;
    cxLabel3: TcxLabel;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    cxLabel4: TcxLabel;
    cxLabel5: TcxLabel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    ActionList1: TActionList;
    Take: TAction;
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButtonEdit3PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton2Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxTextEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure TakeExecute(Sender: TObject);
  private
    myform : Tfmuo_sp_uchplan_add;
    reg : smallint;
    r_id_kurs, r_id_sem, r_id_type : int64;
  public
    constructor Create(AO : TComponent; mform : Tfmuo_sp_uchplan_add; regim : smallint); reintroduce; overload;
  end;

function sem_show(AO : TComponent; mform : Tfmuo_sp_uchplan_add; regim : smallint; var id_kurs, id_sem : int64; var triv : integer; s1, s2, s4 : string) : boolean;

implementation
uses uUO_Loader,
     uPrk_Loader,
     AArray,
     uPrK_Resources;

{$R *.dfm}

function sem_show(AO : TComponent; mform : Tfmuo_sp_uchplan_add; regim : smallint; var id_kurs, id_sem : int64; var triv : integer; s1, s2, s4 : string) : boolean;
var
    T : Tfmuo_sp_ucplan_semhours;
begin
    T := Tfmuo_sp_ucplan_semhours.Create(AO, mform, regim);
    T.r_id_kurs     := id_kurs;
    T.r_id_sem      := id_sem;
//    T.r_id_type     := id_type;
    T.cxButtonEdit1.Text := s1;
    T.cxButtonEdit2.Text := s2;
//    T.cxButtonEdit3.Text := s3;
    T.cxTextEdit1.Text   := s4;
//    T.cxTextEdit2.Text   := s5;

    if T.ShowModal = mrOk then
    begin
        id_kurs     := T.r_id_kurs;
        id_sem      := T.r_id_sem;
//        id_type     := T.r_id_type;
        triv        := StrToInt(T.cxTextEdit1.Text);
//        count_hours := StrToInt(T.cxTextEdit2.Text);
        Result      := true;
    end else
        Result := false;
    T.Free;
end;


constructor Tfmuo_sp_ucplan_semhours.Create(AO: TComponent;
  mform: Tfmuo_sp_uchplan_add; regim: smallint);
begin
    inherited Create(AO);
    myform                := mform;
    reg                   := regim;
end;

procedure Tfmuo_sp_ucplan_semhours.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_SEMESTR.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(myform.DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    r_id_sem := InputParam['OutPut']['ID_SP_SEMESTR'].AsInt64;
    cxButtonEdit2.Text := InputParam['OutPut']['NAME'].AsString + '(' + InputParam['OutPut']['SHORT_NAME'].AsString + ')';

    InputParam.Free;
//    InputParam := Nil;

    if r_id_sem <> -1 then
    begin
//        AddDisc(id_cikl);
{        TWr.DefaultDatabase := DB;
        Stored.Transaction  := TWr;
        try
            TWr.StartTransaction;
            Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS';
            Stored.ParamByName('D_ID_CIKL').AsInt64        := id_cikl;
            Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64 := id;
            Stored.ParamByName('D_ID_SESSION').AsInt64     := id_session;
            Stored.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
        Refresh;
        DSLeft.Locate('ID_SP_CIKL_PDG', id_cikl, []);
 }   end;
end;

procedure Tfmuo_sp_ucplan_semhours.cxButtonEdit3PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    InputParam : TAArray;
begin
    InputParam                                      := TAArray.Create;
    InputParam['Name_Bpl'].AsString                 := 'UO_SP_TYPE_DISC_LESSON.bpl';
    InputParam['Input']['aDBHANDLE'].AsInteger      := Integer(myform.DB.Handle);
    InputParam['Input']['aFrmStyle'].AsVariant      := fsNormal;
    uUO_Loader.ShowAllUOBpl(self, InputParam);

    r_id_type          := InputParam['OutPut']['ID_SP_TYPE_DISC_LESSON'].AsInt64;
    cxButtonEdit3.Text := InputParam['OutPut']['NAME'].AsString + '(' + InputParam['OutPut']['SHORT_NAME'].AsString + ')';

    InputParam.Free;
//    InputParam := Nil;

    if r_id_type <> -1 then
    begin
//        AddDisc(id_cikl);
{        TWr.DefaultDatabase := DB;
        Stored.Transaction  := TWr;
        try
            TWr.StartTransaction;
            Stored.StoredProcName := 'UO_TEMP_UCH_PL_PERELIK_INS';
            Stored.ParamByName('D_ID_CIKL').AsInt64        := id_cikl;
            Stored.ParamByName('D_ID_SP_UCH_PLAN').AsInt64 := id;
            Stored.ParamByName('D_ID_SESSION').AsInt64     := id_session;
            Stored.ExecProc;
            TWr.Commit;
        except on E:Exception do begin
            TWr.Rollback;
            ShowMessage(E.Message);
        end end;
        Refresh;
        DSLeft.Locate('ID_SP_CIKL_PDG', id_cikl, []);
 }   end;
end;

procedure Tfmuo_sp_ucplan_semhours.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure Tfmuo_sp_ucplan_semhours.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    res : Variant;
begin
    res := uPrK_Loader.ShowPrkSprav(self, myform.DB.Handle, PrK_SP_KURS, fsNormal);
    if VarArrayDimCount(res) > 0 then
    begin
        r_id_kurs          := res[0];
        cxButtonEdit1.Text := VarToStr(res[1]) + '(' + VarToStr(res[2]) + ')';

    end
end;

procedure Tfmuo_sp_ucplan_semhours.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

procedure Tfmuo_sp_ucplan_semhours.cxTextEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)

end;

procedure Tfmuo_sp_ucplan_semhours.TakeExecute(Sender: TObject);
begin
    if ((cxTextEdit1.Text = '') or (r_id_kurs <= 0) or (r_id_sem <= 0))
        then Showmessage('Ви ввели не всі данні!')
        else ModalResult := mrOk;
end;

end.
