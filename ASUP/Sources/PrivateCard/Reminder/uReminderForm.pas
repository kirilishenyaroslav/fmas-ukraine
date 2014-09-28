unit uReminderForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, uFControl, uLabeledFControl, uDateControl,
  FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, uBoolControl,
  uEnumControl, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxCalendar, cxLabel, DB, FIBDataSet, pFIBDataSet;

type
  TReminderForm = class(TForm)
    CancelButton: TBitBtn;
    OkButton: TBitBtn;
    qFEC_Range: TqFEnumControl;
    qFBC_Child: TqFBoolControl;
    qFBC_WC: TqFBoolControl;
    qFBC_Inval: TqFBoolControl;
    qFBC_Pension: TqFBoolControl;
    qFBC_All: TqFBoolControl;
    qFBC_HospList: TqFBoolControl;
    DateBeg: TcxDateEdit;
    DateEnd: TcxDateEdit;
    cxLabB: TcxLabel;
    cxLabE: TcxLabel;
    DB: TpFIBDatabase;
    DataSet: TpFIBDataSet;
    Trans: TpFIBTransaction;
    procedure OkButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure qFBC_HospListChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ReminderForm: TReminderForm;

implementation

{$R *.dfm}

uses SpCommon, SpFormUnit, qFTools;

procedure TReminderForm.OkButtonClick(Sender: TObject);
var
    form: TSpForm;
    PropParams: TSpParams;
begin
  if VarIsNull(qFEC_Range.Value) and (qFBC_HospList.Value<>-1) then
   begin
     MessageDlg('Помилка: необхідно обрати період! ',mtError,[mbYes],0);
     ModalResult:=0;
     Exit;
   end;

  try
    if qFBC_Child.Value=-1 then
     begin
       form := TSpForm.Create(Self);
       PropParams := TSpParams.Create;
       with PropParams do
       begin
         Table := 'ASUP_REMINDER_HOLIDAY('+IntToStr(qFEC_Range.Value)+')';
         Title := 'Кінець відпустки по догляду за дитиною';
         IdField := 'TN';
         SpFields := 'FIO, TN, Date_End';
         ColumnNames := 'ФИО, ТН, Дата';
         SpMode := [spfExt];
       end;
       form.Init(PropParams);
       form.ShowModal;
       form.Free;
       PropParams.Free;
     end;
    if qFBC_HospList.Value=-1 then
     begin
       if (DateBeg.Date>DateEnd.Date) then
       begin
           MessageDlg('Помилка: Дата початку не має бути більше ніж дата кінця! ',mtError,[mbYes],0);
           Exit;
       end
       else
       begin
           form := TSpForm.Create(Self);
           PropParams := TSpParams.Create;
           with PropParams do
           begin
              Table := 'ASUP_REM_HOSP('''+DateToStr(DateBeg.Date)+''','''+DateToStr(DateEnd.Date)+''')';
              Title := 'Кінець лікарняних листів';
              IdField := 'TN';
              SpFields := 'FIO, TN, DATE_END';
              ColumnNames := 'ФИО, ТН, Дата';
              SpMode := [spfExt];
           end;
           form.Init(PropParams);
           form.ShowModal;
           form.Free;
           PropParams.Free;
       end;
     end;
    if qFBC_WC.Value=-1 then
     begin
       form := TSpForm.Create(Self);
       PropParams := TSpParams.Create;
       with PropParams do
       begin
         Table := 'ASUP_REMINDER_WC('+IntToStr(qFEC_Range.Value)+')';
         Title := 'Кінець трудової угоди';
         IdField := 'TN';
         SpFields := 'FIO, TN, Date_End';
         ColumnNames := 'ФИО, ТН, Дата';
         SpMode := [spfExt];
       end;
       form.Init(PropParams);
       form.ShowModal;
       form.Free;
       PropParams.Free;
     end;
    if qFBC_Inval.Value=-1 then
     begin
       form := TSpForm.Create(Self);
       PropParams := TSpParams.Create;
       with PropParams do
       begin
         Table := 'ASUP_REMINDER_INVAL('+IntToStr(qFEC_Range.Value)+')';
         Title := 'Кінець строку інвалідності';
         IdField := 'TN';
         SpFields := 'FIO, TN, Date_End';
         ColumnNames := 'ФИО, ТН, Дата';
         SpMode := [spfExt];
       end;
       form.Init(PropParams);
       form.ShowModal;
       form.Free;
       PropParams.Free;
     end;
    if qFBC_Pension.Value=-1 then
     begin
       form := TSpForm.Create(Self);
       PropParams := TSpParams.Create;
       with PropParams do
       begin
         Table := 'ASUP_REMINDER_PENSION('+IntToStr(qFEC_Range.Value)+')';
         Title := 'Дата настання пенсії за віком';
         IdField := 'TN';
         SpFields := 'FIO, TN, Date_End';
         ColumnNames := 'ФИО, ТН, Дата';
         SpMode := [spfExt];
       end;
       form.Init(PropParams);
       form.ShowModal;
       form.Free;
       PropParams.Free;
     end;
//    ShowMessage(IntToStr(qFBC_All.Value));
    if qFBC_All.Value=-1 then
     begin
       form := TSpForm.Create(Self);
       PropParams := TSpParams.Create;
       with PropParams do
       begin
         Table := 'ASUP_REMINDER_ALL('+IntToStr(qFEC_Range.Value)+')';
         Title := 'Перевірка закінчення строків';
         IdField := 'TN';
         SpFields := 'FIO, TN, Date_End, Name';
         ColumnNames := 'ФИО, ТН, Дата, Назва строку';
         SpMode := [spfExt];
       end;
       form.Init(PropParams);
       form.ShowModal;
       form.Free;
       PropParams.Free;
     end;
    ModalResult := 0;
  except on e: Exception do
  begin
    MessageDlg('Помилка: '+e.Message,mtError,[mbYes],0);
    ModalResult := 0;
  end;
  end;
end;

procedure TReminderForm.CancelButtonClick(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

procedure TReminderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qFAutoSaveIntoRegistry(Self, nil);
end;

procedure TReminderForm.FormShow(Sender: TObject);
begin
  qFAutoLoadFromRegistry(Self, nil);
end;

procedure TReminderForm.qFBC_HospListChange(Sender: TObject);
begin
    if qFBC_HospList.Value=-1 then
    begin
        DateBeg.Enabled:=True;
        DateEnd.Enabled:=True;
        qFEC_Range.Enabled:=False;
    end
    else
    begin
        DateBeg.Enabled:=False;
        DateEnd.Enabled:=False;
        qFEC_Range.Enabled:=True;
    end
end;

procedure TReminderForm.FormCreate(Sender: TObject);
begin
    DateBeg.Enabled:=false;
    DateEnd.Enabled:=false;
    DateBeg.Date:=Date;
    DateEnd.Date:=Date;
    if qFBC_HospList.Value=-1 then
    begin
        DateBeg.Enabled:=True;
        DateEnd.Enabled:=True;
        qFEC_Range.Enabled:=False;
    end
    else
    begin
        DateBeg.Enabled:=False;
        DateEnd.Enabled:=False;
        qFEC_Range.Enabled:=True;
    end    
end;

end.
