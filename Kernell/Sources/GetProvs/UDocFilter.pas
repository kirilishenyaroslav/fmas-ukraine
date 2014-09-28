unit UDocFilter;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls, ComCtrls,
  cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit, cxButtonEdit,
  cxDropDownEdit, cxCalendar, ActnList;

type
  TfrmDocFilter = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    GroupBox1: TGroupBox;
    CheckDocSumFrom: TCheckBox;
    Label1: TLabel;
    FilterDocSumFrom: TEdit;
    GroupBox3: TGroupBox;
    Label2: TLabel;
    CheckSch: TCheckBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    CheckDocSumTo: TCheckBox;
    Label8: TLabel;
    FilterDocSumTo: TEdit;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    CheckDocNum: TCheckBox;
    FilterDocNum: TEdit;
    FilterDocSch: TcxButtonEdit;
    cxButton3: TcxButton;
    cbMonth: TComboBox;
    cbYear: TComboBox;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure CheckDocNumClick(Sender: TObject);
    procedure CheckDocSumFromClick(Sender: TObject);
    procedure CheckDocSumToClick(Sender: TObject);
    procedure CheckSchClick(Sender: TObject);
    procedure cxButton3Click(Sender: TObject);
    procedure FilterDocSchPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    id_filter_sch:int64;
    ActualDate:TDateTime;
    { Public declarations }
  end;



implementation

{$R *.dfm}

uses GlobalSpr,UGetProv, Resources_unitb, DateUtils;

procedure TfrmDocFilter.cxButton1Click(Sender: TObject);
begin
     ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
     ModalResult:=mrYes;
end;

procedure TfrmDocFilter.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmDocFilter.CheckDocNumClick(Sender: TObject);
begin
     if CheckDocNum.Checked
     then begin
        if (TfrmSprProvs(owner).work_id_form_kod<>9)
        then FilterDocNum.Color:=clInfoBk
        else FilterDocNum.Color:=clSkyBlue;
        FilterDocNum.Enabled:=true;
     end
     else begin
        FilterDocNum.Color:=clMenu;
        FilterDocNum.Enabled:=false;
     end;
end;

procedure TfrmDocFilter.CheckDocSumFromClick(Sender: TObject);
begin
     if CheckDocSumFrom.Checked
     then begin
        if (TfrmSprProvs(owner).work_id_form_kod<>9)
        then FilterDocSumFrom.Color:=clInfoBk
        else FilterDocSumFrom.Color:=clSkyBlue;
        FilterDocSumFrom.Enabled:=true;
     end
     else begin
        FilterDocSumFrom.Color:=clMenu;
        FilterDocSumFrom.Enabled:=false;
     end;
end;

procedure TfrmDocFilter.CheckDocSumToClick(Sender: TObject);
begin
     if CheckDocSumTo.Checked
     then begin
        if (TfrmSprProvs(owner).work_id_form_kod<>9)
        then FilterDocSumTo.Color:=clInfoBk
        else FilterDocSumTo.Color:=clSkyBlue;
        FilterDocSumTo.Enabled:=true;
     end
     else begin
        FilterDocSumTo.Color:=clMenu;
        FilterDocSumTo.Enabled:=false;
     end;
end;

procedure TfrmDocFilter.CheckSchClick(Sender: TObject);
begin
     if CheckSch.Checked
     then begin
        if (TfrmSprProvs(owner).work_id_form_kod<>9)
        then FilterDocSch.Style.Color:=clInfoBk
        else FilterDocSch.Style.Color:=clSkyBlue;
        FilterDocSch.Enabled:=true;
     end
     else begin
        FilterDocSch.Style.Color:=clMenu;
        FilterDocSch.Enabled:=false;
     end;
end;

procedure TfrmDocFilter.cxButton3Click(Sender: TObject);
begin
    CheckDocSumFrom.Checked:=false;
    CheckSch.Checked:=false;
    CheckDocSumTo.Checked:=false;
    CheckDocNum.Checked:=false;

    CheckDocSumFrom.OnClick(self);
    CheckSch.OnClick(self);
    CheckDocSumTo.OnClick(self);
    CheckDocNum.OnClick(self);
end;

procedure TfrmDocFilter.FilterDocSchPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var Res:Variant;
begin
    ActualDate:=StrToDate('01.'+IntToStr(cbMonth.ItemIndex+1)+'.'+cbYear.Items[cbYear.ItemIndex]);
    Res:=GlobalSpr.GetSch(self,TfrmSprProvs(owner).WorkDatabase.Handle,fsNormal,ActualDate,DEFAULT_ROOT_ID,-1,0);
    if VarArrayDimCount(RES)>0
    then begin
              id_filter_sch:=RES[0][0];
              FilterDocSch.Text:=VarToStr(RES[0][3]);
    end
end;

procedure TfrmDocFilter.FormShow(Sender: TObject);
var i:Integer;
begin
       cbMonth.Items.Clear;
       cbMonth.Clear;

       cbMonth.Items.Add(TRIM(BU_Month_01));
       cbMonth.Items.Add(TRIM(BU_Month_02));
       cbMonth.Items.Add(TRIM(BU_Month_03));
       cbMonth.Items.Add(TRIM(BU_Month_04));
       cbMonth.Items.Add(TRIM(BU_Month_05));
       cbMonth.Items.Add(TRIM(BU_Month_06));
       cbMonth.Items.Add(TRIM(BU_Month_07));
       cbMonth.Items.Add(TRIM(BU_Month_08));
       cbMonth.Items.Add(TRIM(BU_Month_09));
       cbMonth.Items.Add(TRIM(BU_Month_10));
       cbMonth.Items.Add(TRIM(BU_Month_11));
       cbMonth.Items.Add(TRIM(BU_Month_12));

       for i:=0 to YEARS_COUNT do
       begin
            cbYear.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
       end;

       cbMonth.ItemIndex:=MonthOf(ActualDate)-1;
       for i:=0 to cbYear.Items.Count-1 do
       begin
           if pos(cbYear.Items[i],IntToStr(YearOf(ActualDate)))>0
           then begin
                     cbYear.ItemIndex:=i;
                     break;
           end;
       end;
end;

procedure TfrmDocFilter.FormCreate(Sender: TObject);
begin
      if (TfrmSprProvs(owner).work_id_form_kod=9)
      then begin
                cbMonth.Color            :=clSkyBlue;
                cbYear.Color             :=clSkyBlue;
      end;
end;

end.
