unit uSpMinGrantAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, cxMemo, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxLabel, ibase, ActnList, cxCurrencyEdit,DogLoaderUnit;

type
  TfmSpGrantMinAdd = class(TForm)
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    cxLabel3: TcxLabel;
    cxLabel4: TcxLabel;
    DateEditBeg: TcxDateEdit;
    DateEditEnd: TcxDateEdit;
    MemoNote: TcxMemo;
    OkButton: TcxButton;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    ActionSave: TAction;
    ActionExit: TAction;
    TextEditMinSum: TcxCurrencyEdit;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure TextEditMinSumKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TextEditMinSumKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    id_min_sum : variant;
    close_record : integer;
    DB_handle : TISC_DB_HANDLE;
    constructor Create(AOwner:TComponent);reintroduce;
  end;

{var
  fmSpGrantMinAdd: TfmSpGrantMinAdd; }

implementation

uses DM_SpMinGrant;

{$R *.dfm}

constructor TfmSpGrantMinAdd.Create(AOwner:TComponent);
begin
  Screen.Cursor:=crHourGlass;

  inherited Create(AOwner);

  Screen.Cursor:=crDefault;
end;

procedure TfmSpGrantMinAdd.OkButtonClick(Sender: TObject);
begin
  if  (TextEditMinSum.Text = '')  then
  Begin
    ShowMessage('Необхідно заповнити мінимальну суму!');
    TextEditMinSum.SetFocus;
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

  if  (DateEditBeg.Text > DateEditEnd.Text)  then
  Begin
    ShowMessage('Дата початку не може перевищувати дату кінця!');
    DateEditEnd.SetFocus;
    Exit;
  end;

  
  DM.DataSetCheck.Close;
  DM.DataSetCheck.SQLs.SelectSQL.Text := 'select * from CS_MIN_SUM_GR  s where :date_beg between s.date_beg and s.date_end';
  DM.DataSetCheck.ParamByName('date_beg').AsDate := DateEditBeg.Date;
  DM.DataSetCheck.Open;
  DM.DataSetCheck.FetchAll;

  if DM.DataSetCheck.RecordCount>=1 then
  begin
      if MessageDlg('Увага', 'Існує запис на цей період! Бажаєте закрити старий запис?', mtConfirmation, [mbYes, mbNo]) = mrYes then
      begin
          close_record := 1;
      end   else
      begin
          close_record := 0;
          exit;
      end;
  end;


  ModalResult := mrOk;
end;

procedure TfmSpGrantMinAdd.CancelButtonClick(Sender: TObject);
begin
    close;
end;

procedure TfmSpGrantMinAdd.TextEditMinSumKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//
end;

procedure TfmSpGrantMinAdd.TextEditMinSumKeyPress(Sender: TObject;
  var Key: Char);
begin
    if (Key = '-') then Key := Chr(0);
end;

end.
