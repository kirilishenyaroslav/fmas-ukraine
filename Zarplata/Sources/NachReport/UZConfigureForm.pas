unit UZConfigureForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxPropertiesStore, Registry,
  ActnList, ComCtrls;

type
  TfrmZGetConfInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    FormStorage1: TFormStorage;
    ActionList1: TActionList;
    Esc: TAction;
    Action1: TAction;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ShowProgram: TcxCheckBox;
    edProgramInfo: TcxRadioGroup;
    ShowTypeFinance: TcxCheckBox;
    edTypeFinanceInfo: TcxRadioGroup;
    ShowSmGr: TcxCheckBox;
    edTypeSmGrInfo: TcxRadioGroup;
    ShowSm: TcxCheckBox;
    edTypeSmInfo: TcxRadioGroup;
    ShowDep: TcxCheckBox;
    edTypeDepInfo: TcxRadioGroup;
    ShowVidOpl: TcxCheckBox;
    edTypeVidOpl: TcxRadioGroup;
    ShowPost: TcxCheckBox;
    ShowTypePost: TcxCheckBox;
    Panel3: TPanel;
    Label4: TLabel;
    Label2: TLabel;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    Label3: TLabel;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    Panel4: TPanel;
    ShowTarif: TcxCheckBox;
    ShowPostGroup: TcxCheckBox;
    ShowParentDep: TcxCheckBox;
    ShowPostShifr: TcxCheckBox;
    ShowPostAddName: TcxCheckBox;
    ShowKodSetup1: TcxCheckBox;
    ShowKodSetup2: TcxCheckBox;
    ShowCateg: TcxCheckBox;
    edTypePosada: TcxRadioGroup;
    edTypePost: TcxRadioGroup;
    edTypeCateg: TcxRadioGroup;
    procedure cxButton1Click (Sender: TObject);
    procedure FormCreate (Sender: TObject);
    procedure cxButton2Click (Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg: TDateTime;
    DateEnd: TDateTime;
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime);overload;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils,UZNachResult;
{$R *.dfm}

constructor TfrmZGetConfInfo.Create(AOwner: TComponent; DateBeg,DateEnd: TDateTime);
begin
     inherited Create(AOwner);
     self.DateBeg:=DateBeg;
     self.DateEnd:=DateEnd;
end;

procedure TfrmZGetConfInfo.cxButton1Click(Sender: TObject);
begin
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);

     if (DateEnd<DateBeg) then agShowMessage('Дата закінчення не може бути меншою за дату початку')
     else begin
              DateEnd:=IncMonth(DateEnd,1)-1;
              TfrmZNachResults(self.Owner).Panel2.Caption:='  за період '+DateToStr(DateBeg)+'-'+DateToStr(DateEnd);
              ModalResult:=mrYes;
     end;
end;

procedure TfrmZGetConfInfo.FormCreate(Sender: TObject);
var I:      Integer;
    Reg:    TRegistry;
begin
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_01));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_02));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_03));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_04));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_05));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_06));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_07));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_08));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_09));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_10));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_11));
      cbMonthBeg.Properties.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYearBeg.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonthBeg.ItemIndex:=MonthOf(DateBeg)-1;
      for i:=0 to cbYearBeg.Properties.Items.Count-1 do
      begin
           if pos(cbYearBeg.Properties.Items[i],IntToStr(YearOf(DateBeg)))>0
           then begin
              cbYearBeg.ItemIndex:=i;
              break;
           end;
      end;

      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_01));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_02));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_03));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_04));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_05));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_06));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_07));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_08));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_09));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_10));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_11));
      cbMonthEnd.Properties.Items.Add(TRIM(BU_Month_12));

      for i:=0 to YEARS_COUNT do
      begin
          cbYearEnd.Properties.Items.Add(TRIM(IntToStr(BASE_YEAR+i)));
      end;

      cbMonthEnd.ItemIndex:=MonthOf(DateEnd)-1;
      for i:=0 to cbYearEnd.Properties.Items.Count-1 do
      begin
           if pos(cbYearEnd.Properties.Items[i],IntToStr(YearOf(DateEnd)))>0
           then begin
              cbYearEnd.ItemIndex:=i;
              break;
           end;
      end;

      Reg:=TRegistry.Create;
      Reg.RootKey:=HKEY_CURRENT_USER;
      try
        if reg.OpenKey('\Software\ZcxPropertiesStore\',false)
          then begin
            if Reg.ValueExists('ZShowProgram')        then ShowProgram.Checked        :=Reg.ReadBool('ZShowProgram');
            if Reg.ValueExists('ZShowSmGr')           then ShowSmGr.Checked           :=Reg.ReadBool('ZShowSmGr');
            if Reg.ValueExists('ZShowSm')             then ShowSm.Checked             :=Reg.ReadBool('ZShowSm');
            if Reg.ValueExists('ZShowDep')            then ShowDep.Checked            :=Reg.ReadBool('ZShowDep');
            if Reg.ValueExists('ZShowTypePost')       then ShowTypePost.Checked       :=Reg.ReadBool('ZShowTypePost');
            if Reg.ValueExists('ZShowTypeFinance')    then ShowTypeFinance.Checked    :=Reg.ReadBool('ZShowTypeFinance');
            if Reg.ValueExists('ZShowVidOpl')         then ShowVidOpl.Checked         :=Reg.ReadBool('ZShowVidOpl');
            if Reg.ValueExists('ZShowPost')           then ShowPost.Checked           :=Reg.ReadBool('ZShowPost');

            if Reg.ValueExists('ZedTypeProgramInfo')  then edProgramInfo.ItemIndex    :=Reg.ReadInteger('ZedTypeProgramInfo');
            if Reg.ValueExists('ZedTypeSmGrInfo')     then edTypeSmGrInfo.ItemIndex   :=Reg.ReadInteger('ZedTypeSmGrInfo');
            if Reg.ValueExists('ZedTypeSmInfo')       then edTypeSmInfo.ItemIndex     :=Reg.ReadInteger('ZedTypeSmInfo');
            if Reg.ValueExists('ZedTypeDepInfo')      then edTypeDepInfo.ItemIndex    :=Reg.ReadInteger('ZedTypeDepInfo');
            if Reg.ValueExists('ZedTypeFinanceInfo')  then edTypeFinanceInfo.ItemIndex:=Reg.ReadInteger('ZedTypeFinanceInfo');
            if Reg.ValueExists('ZedTypeVidOpl')       then edTypeVidOpl.ItemIndex     :=Reg.ReadInteger('ZedTypeVidOpl');


            if Reg.ValueExists('ZShowTarif')           then ShowTarif.Checked          :=Reg.ReadBool('ZShowTarif');
            if Reg.ValueExists('ZShowPostGroup')       then ShowPostGroup.Checked      :=Reg.ReadBool('ZShowPostGroup');
            if Reg.ValueExists('ZShowParentDep')       then ShowParentDep.Checked      :=Reg.ReadBool('ZShowParentDep');
            if Reg.ValueExists('ZShowPostShifr')       then ShowPostShifr.Checked      :=Reg.ReadBool('ZShowPostShifr');
            if Reg.ValueExists('ZShowPostAddName')     then ShowPostAddName.Checked    :=Reg.ReadBool('ZShowPostAddName');
            if Reg.ValueExists('ZShowKodSetup1')       then ShowKodSetup1.Checked      :=Reg.ReadBool('ZShowKodSetup1');
            if Reg.ValueExists('ZShowKodSetup2')       then ShowKodSetup2.Checked      :=Reg.ReadBool('ZShowKodSetup2');
            if Reg.ValueExists('ZShowCateg')           then ShowCateg.Checked          :=Reg.ReadBool('ZShowCateg');

            if Reg.ValueExists('ZedTypePosada')        then edTypePosada.ItemIndex     :=Reg.ReadInteger('ZedTypePosada');
            if Reg.ValueExists('ZedTypePost')          then edTypePost.ItemIndex       :=Reg.ReadInteger('ZedTypePost');
            if Reg.ValueExists('ZedTypeCateg')         then edTypePost.ItemIndex       :=Reg.ReadInteger('ZedTypeCateg');

          end;
        finally Reg.Free;
      End;
end;

procedure TfrmZGetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmZGetConfInfo.FormClose(Sender: TObject; var Action: TCloseAction);
var Reg:TRegistry;
begin
    Reg:=TRegistry.Create;

    Reg.RootKey:=HKEY_CURRENT_USER;
    try
        Reg.OpenKey('\Software\ZcxPropertiesStore',true);
        Reg.WriteBool('ZShowProgram',          ShowProgram.Checked);
        Reg.WriteBool('ZShowSmGr',             ShowSmGr.Checked);
        Reg.WriteBool('ZShowSm',               ShowSm.Checked);
        Reg.WriteBool('ZShowDep',              ShowDep.Checked);
        Reg.WriteBool('ZShowTypePost',         ShowTypePost.Checked);
        Reg.WriteBool('ZShowTypeFinance',      ShowTypeFinance.Checked);
        Reg.WriteBool('ZShowVidOpl',           ShowVidOpl.Checked);
        Reg.WriteBool('ZShowPost',             ShowPost.Checked);
        Reg.WriteInteger('ZedTypeProgramInfo', edProgramInfo.ItemIndex);
        Reg.WriteInteger('ZedTypeSmGrInfo',    edTypeSmGrInfo.ItemIndex);
        Reg.WriteInteger('ZedTypeSmInfo',      edTypeSmInfo.ItemIndex);
        Reg.WriteInteger('ZedTypeDepInfo',     edTypeDepInfo.ItemIndex);
        Reg.WriteInteger('ZedTypeFinanceInfo', edTypeFinanceInfo.ItemIndex);
        Reg.WriteInteger('ZedTypeVidOpl',      edTypeVidOpl.ItemIndex);

        Reg.WriteBool('ZShowTarif',      ShowTarif.Checked);
        Reg.WriteBool('ZShowPostGroup',  ShowPostGroup.Checked);
        Reg.WriteBool('ZShowParentDep',  ShowParentDep.Checked);
        Reg.WriteBool('ZShowPostShifr',  ShowPostShifr.Checked);
        Reg.WriteBool('ZShowPostAddName',ShowPostAddName.Checked);
        Reg.WriteBool('ZShowKodSetup1',  ShowKodSetup1.Checked);
        Reg.WriteBool('ZShowKodSetup2',  ShowKodSetup2.Checked);
        Reg.WriteBool('ZShowCateg',      ShowCateg.Checked);

        Reg.WriteInteger('ZedTypePosada',edTypePosada.ItemIndex);
        Reg.WriteInteger('ZedTypePost',  edTypePost.ItemIndex);
        Reg.WriteInteger('ZedTypeCateg', edTypeCateg.ItemIndex);

        finally

        Reg.Free;
    end;
end;

procedure TfrmZGetConfInfo.EscExecute(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

end.
