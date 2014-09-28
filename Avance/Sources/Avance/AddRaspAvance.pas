unit AddRaspAvance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxMRUEdit, cxLookAndFeelPainters, cxLabel, ExtCtrls,
  StdCtrls, cxButtons, ActnList, FIBDatabase, pFIBDatabase, DB, FIBDataSet,
  pFIBDataSet, AddChangeAvance, Un_R_file_Alex, Un_lo_file_Alex,
  cxButtonEdit, cxCheckBox;

type
  TModeRas = (AddRas, CHangeRas);

  TfmAddRaspAvance = class(TForm)
    cxMRUEdit: TcxMRUEdit;
    cxTextEditNumber: TcxTextEdit;
    cxTextEditSumma: TcxTextEdit;
    GroupBox1: TGroupBox;
    cxButtonClose: TcxButton;
    cxButton1: TcxButton;
    Bevel1: TBevel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    ActionList1: TActionList;
    ActionAdd: TAction;
    ActionClose: TAction;
    pFIBTransaction1: TpFIBTransaction;
    pFIBDatabase1: TpFIBDatabase;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox1: TcxCheckBox;
    procedure ActionAddExecute(Sender: TObject);
    procedure ActionCloseExecute(Sender: TObject);
    procedure cxTextEditSummaKeyPress(Sender: TObject; var Key: Char);
    procedure cxMRUEditPropertiesButtonClick(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox1Click(Sender: TObject);
  private
    flag :TModeRas;
    id : int64;
    name : string;
    number : integer;
    summa : currency;
    mm : TfmAddChangeAvance;
    s : boolean;
    procedure LoadCaptions;
  public
    id_prov : int64;
    { Public declarations }
  end;

function Show_Ras(n : TfmAddChangeAvance; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TModeRas; var id_r : int64; var sum : Currency; var name_r : string; var num_r : integer; var id_pr : int64; ss : string):boolean;


implementation
uses SelectNeosnProv;
{$R *.dfm}

function Show_Ras(n : TfmAddChangeAvance; db : TpFIBDatabase; Tr : TpFIBTransaction; m : TModeRas; var id_r : int64; var sum : Currency; var name_r : string; var num_r : integer; var id_pr : int64; ss : string):boolean;
var
    T : TfmAddRaspAvance;
begin
    T := TfmAddRaspAvance.Create(nil);
    T.mm := n;
    T.flag := m;
    T.pFIBDatabase1 := db;
    T.pFIBTransaction1 := Tr;

    T.LoadCaptions;

    T.id         := id_r;
    T.name       := name_r;
    T.summa      := sum;
    T.number     := num_r;

    T.cxMRUEdit.Text        := name_r;
    T.cxTextEditSumma.Text  := FloatToStr(sum);
    T.cxTextEditNumber.text := IntToStr(num_r);
    T.s := false;
    if id_pr > 0 then
    begin
        T.cxCheckBox1.Checked := true;
        T.cxButtonEdit1.Text  := ss;
    end;
    T.s := true;

    if T.ShowModal=mrOk then
    begin
        id_r    := T.id;
        name_r  := T.name;
        num_r   := StrToInt(T.cxTextEditNumber.Text);
        sum     := StrToFloat(T.cxTextEditSumma.Text);
        if T.cxCheckBox1.Checked
            then id_pr := T.id_prov
            else id_pr := -1;
        Result  := true;
    end
    else
        Result  := false;
    T.Free
end;

procedure TfmAddRaspAvance.ActionAddExecute(Sender: TObject);
begin
     ModalResult := mrOK;
end;

procedure TfmAddRaspAvance.ActionCloseExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmAddRaspAvance.cxTextEditSummaKeyPress(Sender: TObject;
  var Key: Char);
begin
    if Key = '.' then Key := DecimalSeparator;

    if ((Ord(Key) < 48) or (Ord(Key) > 57))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and (Key <> DecimalSeparator)
    then
        Key := Chr(0)
    else
    if  (Key = DecimalSeparator) and
        (Pos(DecimalSeparator, cxTextEditSumma.Text) > 0)
    then
        Key := Chr(0)
    else
    if ((Length(cxTextEditSumma.Text) - Pos(DecimalSeparator, cxTextEditSumma.Text) > 1) and (Pos(DecimalSeparator,cxTextEditSumma.Text) <> 0))
        and (Ord(Key) <> 8)
        and (Ord(Key) <> VK_DELETE)
        and ((Ord(Key) > 48) or (Ord(Key) < 57))
    then
        Key := Chr(0);
end;

procedure TfmAddRaspAvance.LoadCaptions;
begin
    cxButtonClose.Caption := Un_R_file_Alex.MY_BUTTON_CLOSE;
    cxLabel3.Caption      := Un_R_file_Alex.J4_MAIN_FORM_SUMMA;
    cxLabel2.Caption      := Un_R_file_Alex.J4_MAIN_FORM_NUMBER;
    cxLabel1.Caption      := Un_R_file_Alex.J4_ADD_PROV_RAS;
    GroupBox1.Caption     := Un_R_file_Alex.J4_OSTATOK_ADD_FORM_GR_4;
    cxCheckBox1.Properties.Caption := Un_R_file_Alex.J4_PRIVYAZAT_K_NEOSN;
    caption               := '';
    if flag = AddRas then
    begin
        cxButton1.caption := Un_R_file_Alex.MY_BUTTON_ADD;
    end;
    if flag = CHangeRas then
    begin
        cxButton1.caption := Un_R_file_Alex.MY_BUTTON_EDIT;
    end;
end;

procedure TfmAddRaspAvance.cxMRUEditPropertiesButtonClick(Sender: TObject);
var
    res : Variant;
begin
    res := Un_lo_file_Alex.LoadSpEditSpRazdelAvanse(self, 1, pFIBDatabase1);
    if VarArrayDimCount(res) > 0 then
    begin
        if (res[2]<>null) and (res[0]<>null) then
        begin
            id := res[0];
            name := res[2];
            cxMRUEdit.Text := res[2];
        end;
    end;
end;

procedure TfmAddRaspAvance.cxButtonEdit1PropertiesButtonClick(Sender: TObject; AButtonIndex: Integer);
var
    ss : string;
begin
    if ShowSelectNeosProvRas(mm, id_prov, ss) then
    begin
        cxButtonEdit1.Text := ss;
        
    end;
end;

procedure TfmAddRaspAvance.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxButtonEdit1.Visible := true;
        if s then cxButtonEdit1PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit1.Visible := false;
    end;
end;

end.
