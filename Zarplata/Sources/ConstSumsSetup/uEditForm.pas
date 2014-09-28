unit uEditForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, cxSpinEdit, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxLookAndFeelPainters, cxButtons,
  ConstSumsDM,ZTypes,ZMessages, Unit_ZGlobal_Consts, FIBDatabase,
  pFIBDatabase, FIBQuery, pFIBQuery, pFIBStoredProc, Ibase, ZProc,
  Dates;

type
  TEditForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CancelBtn: TcxButton;
    Label6: TLabel;
    SumEdit: TcxMaskEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    YearEndEdit: TcxSpinEdit;
    Label5: TLabel;
    MonthEndEdit: TcxSpinEdit;
    NoEndCheckBox: TCheckBox;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    YearBegEdit: TcxSpinEdit;
    Label3: TLabel;
    MonthBegEdit: TcxSpinEdit;
    OkBtn: TcxButton;
    ConstTypeEdit: TcxTextEdit;
    DB: TpFIBDatabase;
    StProc: TpFIBStoredProc;
    DefaultTransaction: TpFIBTransaction;
    procedure NoEndCheckBoxClick(Sender: TObject);
    procedure OkBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure YearBegEditPropertiesChange(Sender: TObject);
  private
    DM:TMainDM;
    FEditMode:TZControlFormStyle;
    PLanguageIndex:byte;
    PDb_handle:TISC_DB_HANDLE;
    PId, CPId, ye, me:integer;
    myYear, myMonth, myDay : word;
  public
    constructor Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       EditMode:TZControlFormStyle;Id:integer;ConstType:string;CId:integer);reintroduce;
    property Id:integer read PId;
  end;

var EditForm:TEditForm;

implementation
{$R *.dfm}

constructor TEditForm.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE;
                       EditMode:TZControlFormStyle;Id:integer;ConstType:string;CId:integer);
begin
    inherited Create(AOwner);
    FEditMode:=EditMode;
    PLanguageIndex:= LanguageIndex;
    PId:=Id;
    PDB_Handle:= DB_Handle;
    ConstTypeEdit.Text:=ConstType;
    CPId:=CId;
    case FEditMode of
    zcfsInsert:
     begin
      Caption:=Caption_Insert[PLanguageIndex];
      DecodeDate(Date, myYear, myMonth, myDay);
      YearBegEdit.Value:=myYear;
      YearEndEdit.Value:=myYear;
      MonthEndEdit.Value:=myMonth;
      MonthBegEdit.Value:=myMonth;
     end;
    zcfsUpdate:
    begin
     with StProc do
     begin
      Caption:=Caption_Update[PLanguageIndex];
      DB.Handle := PDb_handle;
      StoredProcName:='Z_CONST_SUMS_S_BY_ID';
      Transaction.StartTransaction;
      Prepare;
      ParamByName('IN_ID').AsInteger:= PId;
      ExecProc;
      YearBegEdit.Value:=ParamByName('YEAR_BEG').AsInteger;
      SumEdit.Text:=FloatToStr(ParamByName('VALUE_SUM').AsFloat);
      MonthBegEdit.Value:=ParamByName('MONTH_BEG').AsInteger;
      ye:=ParamByName('YEAR_END').AsInteger;
      me:=ParamByName('MONTH_END').AsInteger;
      Transaction.Commit;
      if ye=2078 then
       begin
       if me=03 then
         begin
           NoEndCheckBoxClick(self);
           NoEndCheckBox.Checked:=True;
           MonthEndEdit.Value:=MonthBegEdit.Value;
           YearEndEdit.Value:=YearBegEdit.Value;
           NoEndCheckBox.State:=cbChecked;
         end;
         end
      else
       begin
         MonthEndEdit.Value:=me;
         YearEndEdit.Value:=ye;
       end;
      end;
    end;
   end
end;


procedure TEditForm.OkBtnClick(Sender: TObject);
var
    YearEnd, MonthEnd:Integer;
    kod_setup_b:integer;
    kod_setup_e:integer;
begin
  if (SumEdit.Text='') then
  begin
    ZShowMessage('Помилка!','Не заданє поле Сумма!',mtWarning,[mbOk]);
    SumEdit.SetFocus;
  end else
  begin
    if (NoEndCheckBox.Checked) then
    begin
      YearEnd:=2078;
      MonthEnd:=3;
    end else
    begin
      YearEnd:=YearEndEdit.Value;
      MonthEnd:=MonthEndEdit.Value;
    end;

    kod_setup_b:=PeriodToKodSetup(YearBegEdit.Value,MonthBegEdit.Value);
    kod_setup_e:=PeriodToKodSetup(YearEnd,MonthEnd);
    if(kod_setup_e<kod_setup_b)then
    begin
      ZShowMessage('Помилка!','Не вірно вказано період',mtWarning,[mbOk]);
      YearBegEdit.SetFocus;
    end else
    begin
      with StProc do
      try
        case FEditMode of
        zcfsInsert:
        begin
          DB.Handle := PDb_handle;
          StoredProcName:='Z_CONST_SUMS_I';
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID_CONST_TYPE').AsInteger:= PId;
          ParamByName('YEAR_BEG').AsInteger:=YearBegEdit.Value;
          ParamByName('VALUE_SUMM').AsFloat:=StrToFloat(SumEdit.Text);
          ParamByName('YEAR_END').AsInteger:=YearEnd;
          ParamByName('MONTH_END').AsInteger:=MonthEnd;
          ParamByName('MONTH_BEG').AsInteger:=MonthBegEdit.Value;
          ExecProc;
          Transaction.Commit;
        end;
        zcfsUpdate:
        begin
          DB.Handle := PDb_handle;
          StoredProcName:='Z_CONST_SUMS_U';
          Transaction.StartTransaction;
          Prepare;
          ParamByName('ID').AsInteger:= PId;
          ParamByName('ID_CONST_TYPE').AsInteger:=CpId;
          ParamByName('YEAR_BEG').AsInteger:=YearBegEdit.Value;
          ParamByName('VALUE_SUM').AsFloat:=StrToFloat(SumEdit.Text);
          ParamByName('YEAR_END').AsInteger:=YearEnd;
          ParamByName('MONTH_END').AsInteger:=MonthEnd;
          ParamByName('MONTH_BEG').AsInteger:=MonthBegEdit.Value;
          ExecProc;
          Transaction.Commit;
        end;
      end;
      except
      on e:exception do
      begin
        ZShowMessage('Перетин строків дії констант!','Перетин строків дії констант!',mtError,[mbOk]);
        Transaction.Rollback;
      end;
      end;
      ModalResult:=mrOk;
    end;
  end;
end;

procedure TEditForm.NoEndCheckBoxClick(Sender: TObject);
begin

    if (NoEndCheckBox.Checked) then
    begin

        YearEndEdit.Enabled:=False;
        MonthEndEdit.Enabled:=False;

    end
    else
    begin

        YearEndEdit.Enabled:=True;
        MonthEndEdit.Enabled:=True;

    end

end;

procedure TEditForm.CancelBtnClick(Sender: TObject);
begin
Close;
end;

procedure TEditForm.YearBegEditPropertiesChange(Sender: TObject);
var kod_setup_b:integer;
    kod_setup_e:integer;
begin
  kod_setup_b:=PeriodToKodSetup(YearBegEdit.Value,MonthBegEdit.Value);
  kod_setup_e:=PeriodToKodSetup(YearEndEdit.Value,MonthEndEdit.Value);
  
end;

end.
