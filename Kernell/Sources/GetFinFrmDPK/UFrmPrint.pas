unit UFrmPrint;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxEdit, cxRadioGroup, cxCheckBox, Ibase;

type
  TfrmPrintFrm = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    cbMonthBeg: TComboBox;
    cbYearBeg: TComboBox;
    cbMonthEnd: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label5: TLabel;
    ShowSmGr: TcxCheckBox;
    ShowSm: TcxCheckBox;
    ShowRz: TcxCheckBox;
    ShowSt: TcxCheckBox;
    ShowKv: TcxCheckBox;
    edTypeKvInfo: TcxRadioGroup;
    edTypeStInfo: TcxRadioGroup;
    edTypeRzInfo: TcxRadioGroup;
    edTypeSmInfo: TcxRadioGroup;
    edTypeSmGrInfo: TcxRadioGroup;
    ShowSch: TcxCheckBox;
    edTypeSchInfo: TcxRadioGroup;
    ShowReg: TcxCheckBox;
    edTypeRegInfo: TcxRadioGroup;
    procedure cxButton2Click(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
    function CheckConfData:Boolean;
  public
    { Public declarations }
    id_form:Int64;
    DateBeg:TDateTime;
    DateEnd:TDateTime;
    constructor Create(AOwner:Tcomponent;DateBeg, DateEnd:TDateTime;Id_form:Int64);reintroduce;
  end;


implementation

uses DateUtils, GlobalSpr, Resources_unitb, UFrmResults, MainFinFrm;
{$R *.dfm}

constructor TfrmPrintFrm.Create(AOwner: Tcomponent; DateBeg,DateEnd: TDateTime;Id_Form:int64);
var i:Integer;
begin
     inherited Create(AOwner);
     self.DateBeg:=DateBeg;
     self.DateEnd:=DateEnd;
     if YearOf(DateEnd)<>YearOf(DateBeg)
     then DateEnd:=EncodeDate(YearOf(DateBeg),12,31);


     cbMonthBeg.Items.Add(TRIM(BU_Month_01));
     cbMonthBeg.Items.Add(TRIM(BU_Month_02));
     cbMonthBeg.Items.Add(TRIM(BU_Month_03));
     cbMonthBeg.Items.Add(TRIM(BU_Month_04));
     cbMonthBeg.Items.Add(TRIM(BU_Month_05));
     cbMonthBeg.Items.Add(TRIM(BU_Month_06));
     cbMonthBeg.Items.Add(TRIM(BU_Month_07));
     cbMonthBeg.Items.Add(TRIM(BU_Month_08));
     cbMonthBeg.Items.Add(TRIM(BU_Month_09));
     cbMonthBeg.Items.Add(TRIM(BU_Month_10));
     cbMonthBeg.Items.Add(TRIM(BU_Month_11));
     cbMonthBeg.Items.Add(TRIM(BU_Month_12));

     for i:=0 to YEARS_COUNT do
     begin
        cbYearBeg.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
     end;

     cbMonthBeg.ItemIndex:=MonthOf(DateBeg)-1;
     for i:=0 to cbYearBeg.Items.Count-1 do
     begin
         if pos(cbYearBeg.Items[i],IntToStr(YearOf(DateBeg)))>0
         then begin
            cbYearBeg.ItemIndex:=i;
            break;
         end;
     end;


     cbMonthEnd.Items.Add(TRIM(BU_Month_01));
     cbMonthEnd.Items.Add(TRIM(BU_Month_02));
     cbMonthEnd.Items.Add(TRIM(BU_Month_03));
     cbMonthEnd.Items.Add(TRIM(BU_Month_04));
     cbMonthEnd.Items.Add(TRIM(BU_Month_05));
     cbMonthEnd.Items.Add(TRIM(BU_Month_06));
     cbMonthEnd.Items.Add(TRIM(BU_Month_07));
     cbMonthEnd.Items.Add(TRIM(BU_Month_08));
     cbMonthEnd.Items.Add(TRIM(BU_Month_09));
     cbMonthEnd.Items.Add(TRIM(BU_Month_10));
     cbMonthEnd.Items.Add(TRIM(BU_Month_11));
     cbMonthEnd.Items.Add(TRIM(BU_Month_12));

     cbMonthEnd.ItemIndex:=MonthOf(DateEnd)-1;
     Self.id_form:=id_form;
end;

procedure TfrmPrintFrm.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmPrintFrm.cxButton1Click(Sender: TObject);
var T:TfrmFrmResults;
begin
     if CheckConfData
     then begin
               DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]);
               DateEnd:=IncMonth(StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearBeg.Items[cbYearBeg.ItemIndex]),1)-1;
               ModalResult:=mrYes;
     end;
end;

function TfrmPrintFrm.CheckConfData: Boolean;
var Res:Boolean;
begin
     Res:=true;

     if (Integer(ShowSch.Checked)+Integer(ShowSmGr.Checked)+
         Integer(ShowSm.Checked)+Integer(ShowRz.Checked)+
         Integer(ShowSt.Checked)+Integer(ShowKv.Checked)+Integer(ShowReg.Checked)=0)
     then begin
               Res:=false;
               ShowMessage('Не вибрано у розрізі якої аналітики розрахувати звіт.');
     end;

     Result:=Res;
end;

end.
