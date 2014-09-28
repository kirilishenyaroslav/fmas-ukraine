unit AvanceReestrFltr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FIBDatabase, pFIBDatabase, cxControls, cxContainer, cxEdit,
  cxLabel, StdCtrls, cxLookAndFeelPainters, cxButtons, cxTextEdit,
  cxMaskEdit, cxButtonEdit, cxCheckBox, ibase;

type
  TfrmAvanceReestrFltr = class(TForm)
    ImportTrans: TpFIBTransaction;
    GroupBox1: TGroupBox;
    cxCheckBox1: TcxCheckBox;
    cxLabel9: TcxLabel;
    cxButtonEdit2: TcxButtonEdit;
    cxCheckBox2: TcxCheckBox;
    cxTextEditFrom: TcxTextEdit;
    cxTextEditTo: TcxTextEdit;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxButton2: TcxButton;
    cxButton1: TcxButton;
    Db: TpFIBDatabase;
    cxTextEdit1: TcxTextEdit;
    cxTextEdit2: TcxTextEdit;
    procedure cxButtonEdit2PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxTextEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure cxButton1Click(Sender: TObject);
    procedure cxTextEditFromKeyPress(Sender: TObject; var Key: Char);
  private
    kod_sch,tytle_sch : string;
    id_sch_in  : int64;
    date_beg_period_in : tdate;
    prefix : string;
    flag_sch_in, flag_num_in : integer;
  public
    d : TPfibDataBase;
  end;
  function ShowAvanceReestrFltr(dbase : TpFIBDatabase;date_beg_per:tdate; prefix_in : string;var num_avance_beg, num_avance_end : string; var id_sch:int64; var flag_num, flag_sch :integer):boolean;

{var
  frmAvanceReestrFltr: TfrmAvanceReestrFltr; }

implementation
uses Un_R_file_Alex, GlobalSpr;

{$R *.dfm}


function ShowAvanceReestrFltr(dbase : TpFIBDatabase; date_beg_per:tdate; prefix_in : string; var num_avance_beg, num_avance_end : string;var id_sch : int64;var flag_num, flag_sch :integer):boolean;
var
    T : TfrmAvanceReestrFltr;

begin
    T := TfrmAvanceReestrFltr.Create(nil);

    T.db.handle               := dbase.Handle;
    T.db.Open;

    T.date_beg_period_in      := date_beg_per;
    T.prefix                  := prefix_in;

    T.cxTextEdit1.Text        :=  prefix_in;
    T.cxTextEdit2.Text        :=  prefix_in;
    T.flag_sch_in             := 0;
    T.flag_num_in             := 0;

    T.Caption                                    := Un_R_file_Alex.J4_FORM_REESTR_FILTER;
    T.cxCheckBox1.Properties.Caption             := Un_R_file_Alex.J4_SELECT_BY_SCH;
    T.cxCheckBox2.Properties.Caption             := Un_R_file_Alex.J4_SELECT_BY_NUM;

    T.cxLabel9.Caption             := Un_R_file_Alex.J4_NO_OGR_BY_SCH;
    T.cxLabel1.Caption             := Un_R_file_Alex.J4_NO_OGR_BY_NUM;
    T.cxLabel2.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_2;
    T.cxLabel3.Caption             := Un_R_file_Alex.KASSA_FIND_CAP_3;
    T.cxButton2.Caption            := Un_R_file_Alex.OK[1];
    T.cxButton1.Caption            := Un_R_file_Alex.MY_BUTTON_CLOSE;


    if T.ShowModal=mrOk then
    begin
         id_sch           := T.id_sch_in;
         flag_sch         := T.flag_sch_in;
         num_avance_beg   := T.cxTextEditFrom.Text;
         num_avance_end   := T.cxTextEditTo.Text;
         flag_num         := T.flag_num_in;
        Result := true;
    end  else
        Result := false;
end;

procedure TfrmAvanceReestrFltr.cxButtonEdit2PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    Res : Variant;
begin
        Res := GlobalSpr.GetSch(self, Db.Handle, fsNormal, date_beg_period_in, 1, 7, -1);
        if VarArrayDimCount(Res)>0 then
        begin
            id_sch_in    := Res[0][0];
            kod_sch      := Res[0][3];
            tytle_sch    := Res[0][1];
            cxButtonEdit2.Text    := kod_sch+' "'+tytle_sch+'"';
        end;
end;

procedure TfrmAvanceReestrFltr.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxLabel9.Visible      := false;
        cxButtonEdit2.Visible := true;
        cxButtonEdit2.SetFocus;
        cxButtonEdit2PropertiesButtonClick(self, 1);
        flag_sch_in           :=1;
    end else
    begin
        cxButtonEdit2.Visible := false;
        cxLabel9.Visible      := true;
        flag_sch_in           :=0;
    end;
end;

procedure TfrmAvanceReestrFltr.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked then
    begin
        cxLabel1.Visible       := false;
        cxLabel2.Visible       := true;
        cxLabel3.Visible       := true;
        cxTextEditFrom.Visible := true;
        cxTextEditTo.Visible   := true;
        cxTextEdit1.Visible    := true;
        cxTextEdit2.Visible    := true;
        flag_num_in            := 1;
        cxTextEditFrom.SetFocus;
    end else
    begin
        cxLabel1.Visible       := true;
        cxLabel2.Visible       := false;
        cxLabel3.Visible       := false;
        cxTextEditFrom.Visible := false;
        cxTextEditTo.Visible   := false;
        cxTextEdit1.Visible    := false;
        cxTextEdit2.Visible    := false;
        flag_num_in            := 0;
    end;
end;

procedure TfrmAvanceReestrFltr.cxButton2Click(Sender: TObject);
begin
    ModalResult := mrOK;
end;

procedure TfrmAvanceReestrFltr.cxTextEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
    key := chr(0);
end;

procedure TfrmAvanceReestrFltr.cxButton1Click(Sender: TObject);
begin
    close;
end;

procedure TfrmAvanceReestrFltr.cxTextEditFromKeyPress(Sender: TObject;
  var Key: Char);
begin
    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
    then
        Key := Chr(0)
end;

end.


