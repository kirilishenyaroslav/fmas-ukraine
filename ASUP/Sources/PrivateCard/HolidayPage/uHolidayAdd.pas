unit uHolidayAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uLabeledFControl, uSpravControl, uFormControl,
  StdCtrls, Buttons, uCharControl, uIntControl, uDateControl, uInvisControl,
  HolidayDM, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGrid, uSelectForm, qFTools, DateUtils, ComCtrls;

type
  THolidayForm = class(TForm)
    WorkPlace: TqFSpravControl;
    Period_Beg: TqFDateControl;
    Period_end: TqFDateControl;
    Holiday: TqFSpravControl;
    DateBeg: TqFDateControl;
    DateEnd: TqFDateControl;
    HTerm: TqFIntControl;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    FormControl: TqFFormControl;
    Id_Pcard: TqFInvisControl;
    Dont_Calc_Holidays: TqFInvisControl;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    HTermN: TqFIntControl;
    CheckBox: TCheckBox;
    InvisControl: TqFInvisControl;
    Note: TqFCharControl;
    Control2: TqFIntControl;
    Control1: TqFIntControl;
    Label1: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OkButtonClick(Sender: TObject);
    procedure WorkPlaceOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure Period_BegChange(Sender: TObject);
    procedure HolidayOpenSprav(Sender: TObject; var Value: Variant;
      var DisplayText: String);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Period_endChange(Sender: TObject);
    procedure DateBegChange(Sender: TObject);
    procedure DateEndChange(Sender: TObject);
    procedure CheckBoxClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
   	 id,idpcard:Integer;
     Mode:TFormMode;
     BirthDate: TDate;
     constructor Create(Mode: TFormMode; Where: Variant;  aid_pcard:Variant; pps:Boolean; Year_beg: String; Year_end: String);
  end;

var
  HolidayForm: THolidayForm;

implementation

uses uHolidayFrame;

{$R *.dfm}

constructor THolidayForm.Create(Mode: TFormMode; Where: Variant; aid_pcard:Variant; pps:Boolean; Year_beg: String; Year_end: String);
begin
  inherited Create(Nil);
	Self.Mode := Mode;
  Id_PCard.Value := aid_pcard;
  id:=aid_pcard;

  if (pps = True) then
   begin
    Period_Beg.Visible := False;
    Period_End.Visible := False;
    Label1.visible := True;
    Control1.Enabled := True;
    Control1.Visible := True;
    Control2.Enabled := True;
    Control2.Visible := True;
    SpeedButton3.Visible := True;
    SpeedButton4.Visible := True;
    Control1.TabOrder := 0;
    Control2.TabOrder := 1;
    if (year_beg <> '') then
     begin
      Control1.Value := StrToInt (Year_beg);
      Control2.Value := StrToInt (Year_end);
     end;
    WorkPlace.Top := WorkPlace.Top - 44;
    Holiday.Top := Holiday.Top - 44;
    DateBeg.Top := DateBeg.Top - 44;
    DateEnd.Top := DateEnd.Top - 44;
    HTerm.Top := HTerm.Top - 44;
    HTermN.Top := HTermN.Top - 44;
    CheckBox.Top := CheckBox.Top - 44;
    OkButton.Top := OkButton.Top - 35;
    CancelButton.Top := CancelButton.Top - 35;
    SpeedButton1.Top := SpeedButton1.Top - 44;
    SpeedButton2.Top := SpeedButton2.Top - 44;
    Note.Top := Note.Top - 44;
{   HolidayForm.Height := HolidayForm.Height - 44;
    HolidayForm.ClientHeight := HolidayForm.ClientHeight - 56;}

   end
  else
    begin
    Period_Beg.Enabled := True;
    Period_Beg.Visible := True;
    Period_End.Enabled := True;
    Period_End.Visible := True;
    Label1.visible := False;
    Control1.Enabled := False;
    Control1.Visible := False;
    Control2.Enabled := False;
    Control2.Visible := False;
    end;

  FormControl.Prepare(DM.DB,Mode,Where,null);
  Id_PCard.SetValue(aid_pcard);
end;

procedure THolidayForm.FormActivate(Sender: TObject);
begin
  OkButton.SetFocus;
end;

procedure THolidayForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Action := caFree;
end;

procedure THolidayForm.OkButtonClick(Sender: TObject);
begin
    if Control1.Visible = True then
      begin
        if ((Control1.Value >999) and (Control1.Value < 9999) and
            (Control2.Value >999) and (Control2.Value < 9999)) then
         begin
          Period_Beg.Value := StrToDate('01.09.' + IntToStr(Control1.Value));
          Period_End.Value := StrToDate('31.08.' + IntToStr(Control2.Value));
         end
          else
           begin
            MessageDlg('Рiк початку або кiнця роботи не вiрний!',mtError,[mbYes],0);
            Exit;
           end;
      end;
    if (CheckBox.Checked = True) then
      begin
        HTermN.Enabled := False;
        InvisControl.Enabled := True;
        InvisControl.Value := 0;
      end;
    FormControl.Ok;
end;

procedure THolidayForm.WorkPlaceOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
    DM.SelectCurWorkPlace.Close;
    Dm.SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := Period_Beg.Value;
    Dm.SelectCurWorkPlace.ParamByName('ID_PCARD').AsInteger := Id_PCard.Value;
    Dm.SelectCurWorkPlace.Open;

    if qSelect(DM.SelectCurWorkPlace) then
    begin
        Value := DM.SelectCurWorkPlace['id_man_moving'];
        DisplayText := DM.SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + DM.SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
    end;
end;

procedure THolidayForm.Period_BegChange(Sender: TObject);
begin
    try
        Period_End.Value := IncYear(Period_Beg.Value) - 1;

        if FormControl.Mode = fmAdd then begin
            DM.SelectCurWorkPlace.Close;
            Dm.SelectCurWorkPlace.ParamByName('CUR_DATE').AsDate := Period_Beg.Value;
            Dm.SelectCurWorkPlace.ParamByName('ID_PCARD').AsInteger := Id_PCard.Value;
            Dm.SelectCurWorkPlace.Open;
            Dm.SelectCurWorkPlace.FetchAll;

            if Dm.SelectCurWorkPlace.RecordCount = 1 then begin
                WorkPlace.Value := DM.SelectCurWorkPlace['rmoving'];
                WorkPlace.DisplayText := DM.SelectCurWorkPlace['NAME_POST_SALARY'] + ' (' + DM.SelectCurWorkPlace['NAME_DEPARTMENT'] + ')';
            end
            else begin
                WorkPlace.Value := null;
                WorkPlace.DisplayText := '';
            end;
        end;

        if FormControl.Mode=fmInfo then begin
            Period_Beg.Enabled:=False;
        end
        else begin
            Period_Beg.Enabled:=True;
        end;

    except
    end;
end;

procedure THolidayForm.HolidayOpenSprav(Sender: TObject;
  var Value: Variant; var DisplayText: String);
begin
   Dm.SpHolidaySelect.Close;
    Dm.SpHolidaySelect.Open;

    if qSelect(Dm.SpHolidaySelect, 'Довідник типів відпусток') then
    begin
        Value := Dm.SpHolidaySelectID_HOLIDAY.Value;
        DisplayText := Dm.SpHolidaySelectNAME_HOLIDAY.Value;
        Dont_Calc_Holidays.Value := Dm.SpHolidaySelectDONT_CALC_HOLIDAYS.Value;
    end;
end;

procedure THolidayForm.SpeedButton2Click(Sender: TObject);
var
  int : Integer;
begin
    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    int := Trunc(DateEnd.Value - DateBeg.Value) + 1;

    HTerm.Value := int;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    Dm.CheckQuery.Close;
    Dm.CheckQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
    Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
    Dm.CheckQuery.Open;

    HTerm.Value := int - Dm.CheckQueryHCOUNT.value;
end;

procedure THolidayForm.SpeedButton1Click(Sender: TObject);
var
    Date1 : TDate;
begin
    if (VarIsNull(Holiday.Value)) or (Holiday.DisplayText = '') then begin
        qFErrorDialog('Потрібно вибрати тип відпустки!');
        exit;
    end;

    if (VarIsNull(HTerm.Value)) then begin
        qFErrorDialog('Потрібно вести кілкість днів відпустки!');
        exit;
    end;

    DateEnd.Value := DateBeg.Value + HTerm.Value - 1;

    if DONT_CALC_HOLIDAYS.Value = 'F' then
        exit;

    Dm.CheckQuery.Close;
    Dm.CheckQuery.ParamByName('DATE1').AsDate := DateBeg.Value;
    Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
    Dm.CheckQuery.Open;

    while DM.CheckQueryHCOUNT.Value > 0
    do begin
        Date1 := DateEnd.Value + 1;
        DateEnd.Value := DateEnd.Value + Dm.CheckQueryHCOUNT.Value;

        Dm.CheckQuery.Close;
        Dm.CheckQuery.ParamByName('DATE1').AsDate := Date1;
        Dm.CheckQuery.ParamByName('DATE2').AsDate := DateEnd.Value;
        Dm.CheckQuery.Open;
    end;
end;

procedure THolidayForm.Period_endChange(Sender: TObject);
begin
   if FormControl.Mode=fmInfo then begin
       Period_Beg.Enabled:=False;
     end
    else begin
       Period_Beg.Enabled:=True;
      end;
end;

procedure THolidayForm.DateBegChange(Sender: TObject);
begin
   if FormControl.Mode=fmInfo then begin
       DateBeg.Enabled:=False;
     end
    else begin
       DateBeg.Enabled:=True;
      end;
end;

procedure THolidayForm.DateEndChange(Sender: TObject);
begin
   if FormControl.Mode=fmInfo then begin
       DateEnd.Enabled:=False;
     end
    else begin
       DateEnd.Enabled:=True;
      end;
end;

procedure THolidayForm.CheckBoxClick(Sender: TObject);
begin
    HTermN.Value := 0;
end;

procedure THolidayForm.SpeedButton3Click(Sender: TObject);
 var
   beg_d, end_d :string;
begin
  Control1.Value := Control1.Value + 1;
  Control2.Value := Control2.Value + 1;
  beg_d := DateToStr(DateBeg.Value);
  end_d := DateToStr(DateEnd.Value);
  Delete(beg_d,7,4);
  Delete(end_d,7,4);
  DateBeg.Value := StrToDate(beg_d + IntToStr (Control2.Value));
  DateEnd.Value := StrToDate(end_d + IntToStr (Control2.Value));
end;

procedure THolidayForm.SpeedButton4Click(Sender: TObject);
 var
   beg_d, end_d :string;
begin
  Control1.Value := Control1.Value - 1;
  Control2.Value := Control2.Value - 1;

  beg_d := DateToStr(DateBeg.Value);
  end_d := DateToStr(DateEnd.Value);
  Delete(beg_d,7,4);
  Delete(end_d,7,4);
  DateBeg.Value := StrToDate(beg_d + IntToStr (Control2.Value));
  DateEnd.Value := StrToDate(end_d + IntToStr (Control2.Value));

end;

end.
