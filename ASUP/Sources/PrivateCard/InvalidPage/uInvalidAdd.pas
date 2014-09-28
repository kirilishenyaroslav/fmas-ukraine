unit uInvalidAdd;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, FieldControl, SpComboBox, Buttons, ComCtrls, EditControl,
    uInvalidDataModule, uCommonSp, SpCommon, cxControls, cxContainer, cxEdit,
    cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,UpKernelUnit,
  uFControl, uLabeledFControl, uSpravControl;

type
    TAddInvalidForm = class(TForm)
        SpCB_Inv: TSpComboBox;
        FC_Inv: TFieldControl;
        Label1: TLabel;
        Label8: TLabel;
        Label7: TLabel;
        Label6: TLabel;
        CB_Child: TCheckBox;
        CB_Always: TCheckBox;
        OkButton: TBitBtn;
        CancelButton: TBitBtn;
        DT_DateBeg: TcxDateEdit;
        DT_DateEnd: TcxDateEdit;
    ReasonInv: TcxTextEdit;
    NomInv: TcxTextEdit;
    Label2: TLabel;
    Label3: TLabel;
    OpenSpr: TSpeedButton;
    SprEdit: TEdit;
        procedure CB_ChildClick(Sender: TObject);
        procedure FormShow(Sender: TObject);
        procedure FormCreate(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure CancelButtonClick(Sender: TObject);
        procedure OkButtonClick(Sender: TObject);
        procedure CB_AlwaysClick(Sender: TObject);
    procedure OpenSprClick(Sender: TObject);
    public
        Add: Boolean;
        id_inv, id_pcard: integer;
        FormControl: TEditControl;
        date_beg, date_end: TDate;
        DM: TdmInvalid;
        id_group_1:Integer;
    end;

var
    Form1: TAddInvalidForm;

implementation

{$R *.dfm}

uses BaseTypes, uInvalidGroup;

procedure TAddInvalidForm.CB_ChildClick(Sender: TObject);
begin
    DT_DateBeg.Enabled := not CB_Child.Checked;
end;

procedure TAddInvalidForm.FormShow(Sender: TObject);
begin
    if (not Add) then
    begin
        CB_Child.Checked := (date_beg = StrToDate('01.01.1900'));
        CB_ChildClick(CB_Child);

        CB_Always.Checked := (date_end = StrToDate('31.12.9999'));
        CB_AlwaysClick(CB_Always);
    end;
end;

procedure TAddInvalidForm.FormCreate(Sender: TObject);
begin
    DM := TdmInvalid.Create(Self);
    FormControl := TEditControl.Create;
    FormControl.Add([FC_Inv]);
    FormControl.Prepare(emNew);
    date_beg := Date();
    date_end := Date() + 365;

    SpCB_Inv.LoadFromRegistry;
end;

procedure TAddInvalidForm.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    FormControl.Free;
    SpCB_Inv.SaveIntoRegistry;
end;

procedure TAddInvalidForm.CancelButtonClick(Sender: TObject);
begin
    ModalResult := mrCancel;
    Close;
end;

procedure TAddInvalidForm.OkButtonClick(Sender: TObject);
var s: string;
begin
    FormControl.Read;
    if (CB_Child.Checked) then DT_DateBeg.Date := StrToDate('01.01.1900');
    if (CB_Always.Checked) then DT_DateEnd.Date := StrToDate('31.12.9999');

     // проверка на заполнение даты
    if Trim(DT_DateBeg.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть дату почаку!', mtError, [mbOk]);
        DT_DateBeg.SetFocus;
        DT_DateBeg.Style.Color := clRed;
        ModalResult := 0;
        Exit;
    end;
    if (DT_DateBeg.Date < StrToDate('01.01.1900')) then DT_DateBeg.Date := StrToDate('01.01.1900');

    // проверка на заполнение даты
    if Trim(DT_DateEnd.Text) = '' then
    begin
        agMessageDlg('”вага!', '¬вед≥ть дату к≥нц€!', mtError, [mbOk]);
        DT_DateEnd.SetFocus;
        DT_DateEnd.Style.Color := clRed;
        ModalResult := 0;
        Exit;
    end;

    if (DT_DateBeg.Date > DT_DateEnd.Date) then
    begin
        agMessageDlg('”вага!', 'ƒата початку маЇ бути меншою за дату к≥нц€!', mtError, [mbOk]);
        ModalResult := 0;
        Exit;
    end;

    with DM do
    try
        DefaultTransaction.StartTransaction;
        StartHistory(DefaultTransaction);
        if (not Add) then
        begin
            DeleteQuery.ParamByName('id_pcard').AsInteger := id_pcard;
            DeleteQuery.ParamByName('id_invalid').AsInteger := id_inv;
            DeleteQuery.ParamByName('date_beg').AsDate := date_beg;
            DeleteQuery.ParamByName('date_end').AsDate := date_end;
            DeleteQuery.ExecProc;
        end;
        InsertUpdate.ParamByName('id_pcard').AsInteger := id_pcard;
        InsertUpdate.ParamByName('id_invalid').AsInteger := id_group_1;
        InsertUpdate.ParamByName('date_beg').AsDate := DT_DateBeg.Date;
        InsertUpdate.ParamByName('date_end').AsDate := DT_DateEnd.Date;
        InsertUpdate.ParamByName('REASON_INV').AsString:=ReasonInv.Text;
        InsertUpdate.ParamByName('NOM_INV').AsString:=NomInv.Text;
        InsertUpdate.ExecProc;

        DefaultTransaction.Commit;
        ModalResult := mrOk;
    except on e: Exception do
        begin
            if Add then s := 'додати' else s := 'зм≥нити';
            MessageDlg('Ќе вдалос€ ' + s + ' запис: ' + #13 + e.Message, mtError, [mbYes], 0);
            DefaultTransaction.RollBack;
            ModalResult := 0;
        end;
    end;
end;


procedure TAddInvalidForm.CB_AlwaysClick(Sender: TObject);
begin
    DT_DateEnd.Enabled := not CB_Always.Checked;
end;

procedure TAddInvalidForm.OpenSprClick(Sender: TObject);
Var frm:TfrmInvalidGroup;
begin
    frm:=TfrmInvalidGroup.Create(Self);
    if frm.ShowModal=mrok then
    begin
        id_group_1:=frm.id_group;
        SprEdit.Text:=frm.name_group;
    end;
    frm.Free;
end;

end.

