unit uGrantRulesAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxButtonEdit, StdCtrls, cxButtons,
  cxMemo, cxMaskEdit, cxDropDownEdit, cxCalendar, cxTextEdit, cxControls,
  cxContainer, cxEdit, cxLabel, ibase, ucs_types,uCs_loader,
  cxCurrencyEdit, ActnList, Menus;

type
  TfmGrantRulesAdd = class(TForm)
    LabelSubType: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DateEditBeg: TcxDateEdit;
    DateEditEnd: TcxDateEdit;
    MemoNote: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    Labelkoef: TcxLabel;
    LabelAddSum: TcxLabel;
    ButtonEditSubType: TcxButtonEdit;
    LabelMinGrant: TcxLabel;
    ButtonEditMinGrant: TcxButtonEdit;
    cxLabel1: TcxLabel;
    TextEditKoef: TcxCurrencyEdit;
    TextEditAddSum: TcxCurrencyEdit;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    TextEditAllSum: TcxCurrencyEdit;
    procedure CancelButtonClick(Sender: TObject);
    procedure OkButtonClick(Sender: TObject);
    procedure ButtonEditSubTypePropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure ButtonEditMinGrantPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure TextEditKoefExit(Sender: TObject);
    procedure TextEditKoefKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    id_min_sum, id_grant_subType : variant;
    id_grant_rules : variant;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmGrantRulesAdd: TfmGrantRulesAdd; }

implementation

uses DM_GrantRules;

{$R *.dfm}

constructor TfmGrantRulesAdd.Create(AOwner:TComponent);
begin

  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmGrantRulesAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmGrantRulesAdd.OkButtonClick(Sender: TObject);
begin
    if  (id_grant_subType= null)  then
    Begin
        ShowMessage('Необхідно вибрати тип стипендії!');
        ButtonEditSubType.SetFocus;
        Exit;
    end;

    if  (id_min_sum = null)  then
    Begin
        ShowMessage('Необхідно вибрати розмір мінімальної стипендії!');
        ButtonEditSubType.SetFocus;
        Exit;
    end;

    if  (TextEditKoef.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити коефіцієнт!');
      TextEditKoef.SetFocus;
      Exit;
    end;

    if  (TextEditAddSum.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити додаткову суму!');
      TextEditAddSum.SetFocus;
      Exit;
    end;

    if  (DateEditBeg.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити дату початку!');
      DateEditBeg.SetFocus;
      Exit;
    end;

    if  (DateEditEnd.Text = '')  then
    Begin
      ShowMessage('Необхідно заповнити дату кінця!');
      DateEditEnd.SetFocus;
      Exit;
    end;

    if  (DateEditBeg.Date > DateEditEnd.Date)  then
    Begin
      ShowMessage('Дата початку не може перевищувати дату кінця!');
      DateEditBeg.SetFocus;
      Exit;
    end;


    ModalResult := mrok;
end;

procedure TfmGrantRulesAdd.ButtonEditSubTypePropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TcsParamPacks;
    res : variant;
begin
    AParameter := TcsParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;

    res := DoFunctionFromPackage(AParameter, ['Contingent_Student\CS_SubTypeGrant.bpl', 'ShowGrantSubType']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_grant_subType := res[0];
        ButtonEditSubType.Text:= vartostr(res[1]);
    end;
end;


procedure TfmGrantRulesAdd.ButtonEditMinGrantPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
    AParameter: TcsParamPacks;
    res : variant;
begin
    AParameter := TcsParamPacks.Create;
    AParameter.Owner := self;
    AParameter.Db_Handle := dm.Db.Handle;
    AParameter.Formstyle := fsNormal;
    res := DoFunctionFromPackage(AParameter, ['Contingent_Student\CS_SpMinGrant.bpl', 'ShowSpGrantMin']);
    AParameter.Free;

    if VarArrayDimCount(res)>0 then
    begin
        id_min_sum := res[0];
        ButtonEditMinGrant.Text:= currtostr(res[1]);
        TextEditKoefExit(self);
    end;

end;

procedure TfmGrantRulesAdd.TextEditKoefExit(Sender: TObject);
var summa_all, min_grant : currency;
begin

    if(TextEditKoef.Text= '') then  TextEditKoef.Text := '1,0000';
    if(ButtonEditMinGrant.Text= '') then  min_grant := 0
    else min_grant := strtocurr(ButtonEditMinGrant.Text);
    if(TextEditAddSum.Text= '') then  TextEditAddSum.Text := '0,00';
    summa_all := min_grant*strtocurr(TextEditKoef.Text)+ strtocurr(TextEditAddSum.Text);
    TextEditAllSum.Text := currtostr(summa_all);
end;

procedure TfmGrantRulesAdd.TextEditKoefKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '-') then Key := Chr(0);
end;

end.
