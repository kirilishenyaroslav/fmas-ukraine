unit SpravkaFitterPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxRadioGroup,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxCalendar, cxCheckBox, cxButtonEdit, FIBDatabase,
  pFIBDatabase, Placemnt;

type
  TfmSpravkaFitterPrint = class(TForm)
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cxDateEdit1: TcxDateEdit;
    cxRadioGroup1: TcxRadioGroup;
    cxRadioButton3: TcxRadioButton;
    cxRadioButton4: TcxRadioButton;
    cxRadioButton5: TcxRadioButton;
    cxCheckBox1: TcxCheckBox;
    cxCheckBox2: TcxCheckBox;
    cxButtonEdit1: TcxButtonEdit;
    cxCheckBox3: TcxCheckBox;
    pFIBDatabase1: TpFIBDatabase;
    FormStorage1: TFormStorage;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxCheckBox2Click(Sender: TObject);
    procedure cxCheckBox1Click(Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxCheckBox3Click(Sender: TObject);
  private
    id_smeta : int64;
    dd : Tpfibdatabase;
  public
    { Public declarations }
  end;

function Show_filter_Print(Ao : TComponent; var date_beg, date_end : TDate; Var ind, priz : integer; var id_sm : int64; d : Tpfibdatabase) : boolean;

implementation
uses Un_R_file_Alex, SpravkaUnitCaption, GlobalSPR;

{$R *.dfm}

function Show_filter_Print(Ao : TComponent; var date_beg, date_end : TDate; Var ind, priz : integer; var id_sm : int64; d : Tpfibdatabase) : boolean;
var
    T : TfmSpravkaFitterPrint;
begin
    T    := TfmSpravkaFitterPrint.Create(Ao);
    T.dd := d;
    T.Caption                := '';
    T.cxCheckBox1.Properties.Caption := SpravkaUnitCaption.PRINT_MONTH;
    T.cxCheckBox2.Properties.Caption := SpravkaUnitCaption.PRINT_DAY;
    T.cxCheckBox3.Properties.Caption := SpravkaUnitCaption.PRINT_WITH_SMETA;
    T.cxButton1.Caption      := Un_R_file_Alex.MY_ACTION_PRINT_CONST;
    T.cxButton2.Caption      := Un_R_file_Alex.MY_ACTION_CLOSE_VIH;
    T.cxRadioButton3.Caption := Un_R_file_Alex.KASSA_FIND_CAP_7;
    T.cxRadioButton4.Caption := Un_R_file_Alex.KASSA_FIND_CAP_8;
    T.cxRadioButton5.Caption := Un_R_file_Alex.KASSA_FIND_CAP_9;
    T.cxDateEdit1.Visible    := false;
    T.cxDateEdit1.Date       := date;
    if T.Showmodal = mrOK then
    begin
        if T.cxCheckBox1.checked
            then begin
                ind      := 1;
            end
            else begin
                ind      := 0;
                date_beg := T.cxDateEdit1.Date;
                date_end := T.cxDateEdit1.Date;
            end;
        if T.cxRadioButton3.Checked then priz := 0;
        if T.cxRadioButton4.Checked then priz := 1;
        if T.cxRadioButton5.Checked then priz := 2;
        if T.cxCheckBox3.checked    then id_sm := T.id_smeta else id_sm := -1; 
        Result := true;
    end else
    begin
        Result := false;
    end;
    T.Free;
end;

procedure TfmSpravkaFitterPrint.cxButton1Click(Sender: TObject);
begin
    if (not cxCheckBox1.Checked) and (not cxCheckBox2.Checked) then exit;
    ModalResult := mrOk;
end;

procedure TfmSpravkaFitterPrint.cxButton2Click(Sender: TObject);
begin
    Close;
end;

procedure TfmSpravkaFitterPrint.cxCheckBox2Click(Sender: TObject);
begin
    if cxCheckBox2.Checked then
    begin
        cxDateEdit1.visible := true;
        cxCheckBox1.Checked := false;
    end
end;

procedure TfmSpravkaFitterPrint.cxCheckBox1Click(Sender: TObject);
begin
    if cxCheckBox1.Checked then
    begin
        cxDateEdit1.visible := false;
        cxCheckBox2.Checked := false
    end;
end;

procedure TfmSpravkaFitterPrint.cxButtonEdit1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    rr : variant;
begin
    rr := GlobalSPR.GetSmets(Self, dd.Handle, date, psmSmet);
    if VarArrayDimCount(rr)>0 then
    begin
        if rr[0]<>NULL then
        begin
            id_smeta           := rr[0];
            cxButtonEdit1.Text := VarToStr(rr[3]) + ' ' + VarToStr(rr[2]);
        end;
    end;
end;

procedure TfmSpravkaFitterPrint.cxCheckBox3Click(Sender: TObject);
begin
    if cxCheckBox3.Checked then
    begin
        cxButtonEdit1.Visible := true;
        cxButtonEdit1PropertiesButtonClick(self, 0);
    end else
    begin
        cxButtonEdit1.Visible := false;
    end;
end;

end.
