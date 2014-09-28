unit UConfigureForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCheckBox, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxRadioGroup, Placemnt, cxDropDownEdit, cxPropertiesStore, Registry,
  ActnList, pFibDataSet, FIBDatabase, pFIBDatabase, ibase;

type
  TfrmGetConfInfo = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    cxButtonEdit1: TcxButtonEdit;
    Label1: TLabel;
    ShowSmGr: TcxCheckBox;
    ShowSm: TcxCheckBox;
    ShowRz: TcxCheckBox;
    ShowSt: TcxCheckBox;
    ShowKv: TcxCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edTypeSchInfo: TcxRadioGroup;
    edTypeSmGrInfo: TcxRadioGroup;
    edTypeSmInfo: TcxRadioGroup;
    edTypeRzInfo: TcxRadioGroup;
    edTypeStInfo: TcxRadioGroup;
    edTypeKvInfo: TcxRadioGroup;
    cxButton2: TcxButton;
    ShowProgram: TcxCheckBox;
    edProgramInfo: TcxRadioGroup;
    FormStorage1: TFormStorage;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    ShowSch: TcxCheckBox;
    ShowInSaldo: TcxCheckBox;
    ShowOutSaldo: TcxCheckBox;
    ActionList1: TActionList;
    Esc: TAction;
    Action1: TAction;
    edTypeAnInfo: TcxRadioGroup;
    ShowAn: TcxCheckBox;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    procedure cxButton1Click (Sender: TObject);
    procedure FormCreate (Sender: TObject);
    procedure cxButtonEdit1PropertiesButtonClick (Sender: TObject; AButtonIndex: Integer);
    procedure cxButton2Click (Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowSchPropertiesChange(Sender: TObject);
    procedure ShowProgramPropertiesChange(Sender: TObject);
    procedure ShowSmGrPropertiesChange(Sender: TObject);
    procedure ShowSmPropertiesChange(Sender: TObject);
    procedure ShowRzPropertiesChange(Sender: TObject);
    procedure ShowStPropertiesChange(Sender: TObject);
    procedure ShowKvPropertiesChange(Sender: TObject);
    procedure EscExecute(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    DateBeg: TDateTime;
    DateEnd: TDateTime;
    id_sch:  Int64;
    RES:     variant;
    constructor Create(AOwner:TComponent;DateBeg,DateEnd:TDateTime;id_s:int64; DBHandle:TISC_DB_HANDLE);overload;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils,UMainResults;
{$R *.dfm}

constructor TfrmGetConfInfo.Create(AOwner: TComponent; DateBeg,DateEnd: TDateTime;id_s: Int64;DBHandle:TISC_DB_HANDLE);
begin
     inherited Create(AOwner);
     Self.id_sch:=id_s;
     workdatabase.handle:=dbhandle;
     readtransaction.starttransaction;
     self.DateBeg:=DateBeg;
     self.DateEnd:=DateEnd;
end;

procedure TfrmGetConfInfo.cxButton1Click(Sender: TObject);
begin
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);
     if (trunc(DateEnd-DateBeg)>0) and (ShowInSaldo.Enabled) and (ShowOutSaldo.Enabled)
      and ((ShowInSaldo.Checked) or (ShowOutSaldo.Checked)) then begin
              agShowMessage('Для розрахунку сальдо довжива періоду повинна бути не більш ніж один місяць.');
              exit;
     end;
     if (DateEnd<DateBeg) then agShowMessage('Дата закінчення не може бути меншою за дату початку')
     else begin
              DateEnd:=IncMonth(DateEnd,1)-1;
              TfrmMainResults(self.Owner).Panel2.Caption:='  за період '+DateToStr(DateBeg)+'-'+DateToStr(DateEnd);
              ModalResult:=mrYes;
     end;
end;

procedure TfrmGetConfInfo.FormCreate(Sender: TObject);
var
I:      Integer;
Reg:    TRegistry;
name_sch:   string;
num_sch:    string;
getSchInfo:TpFibDataSet;
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
      if TForm(Self.Owner).FormStyle<>fsNormal
      then begin
                      try
                          if reg.OpenKey('\Software\cxPropertiesStore\',false)
                          then begin


                            if Reg.ValueExists('RES_0_0')      then id_sch  :=Reg.ReadInteger('RES_0_0');
                            if Reg.ValueExists('RES_0_1')      then name_sch:=Reg.ReadString ('RES_0_1');
                            if Reg.ValueExists('RES_0_3')      then num_sch :=Reg.ReadString ('RES_0_3');

                            if Reg.ValueExists('ShowSch')      then ShowSch.Checked     :=Reg.ReadBool('ShowSch');
                            if Reg.ValueExists('ShowInSaldo')  then ShowInSaldo.Checked  :=Reg.ReadBool('ShowInSaldo');
                            if Reg.ValueExists('ShowOutSaldo') then ShowOutSaldo.Checked :=Reg.ReadBool('ShowOutSaldo');
                            if Reg.ValueExists('ShowProgram')  then ShowProgram.Checked :=Reg.ReadBool('ShowProgram');
                            if Reg.ValueExists('ShowSmGr')     then ShowSmGr.Checked    :=Reg.ReadBool('ShowSmGr');
                            if Reg.ValueExists('ShowSm')       then ShowSm.Checked      :=Reg.ReadBool('ShowSm');
                            if Reg.ValueExists('ShowRz')       then ShowRz.Checked      :=Reg.ReadBool('ShowRz');
                            if Reg.ValueExists('ShowSt')       then ShowSt.Checked      :=Reg.ReadBool('ShowSt');
                            if Reg.ValueExists('ShowKv')       then ShowKv.Checked      :=Reg.ReadBool('ShowKv');
                            if Reg.ValueExists('ShowAn')       then ShowAn.Checked      :=Reg.ReadBool('ShowAn');
                            if Reg.ValueExists('edTypeSchInfo')     then edTypeSchInfo.ItemIndex   :=Reg.ReadInteger('edTypeSchInfo');
                            if Reg.ValueExists('edTypeProgramInfo') then edProgramInfo.ItemIndex   :=Reg.ReadInteger('edTypeProgramInfo');
                            if Reg.ValueExists('edTypeSmGrInfo')    then edTypeSmGrInfo.ItemIndex  :=Reg.ReadInteger('edTypeSmGrInfo');
                            if Reg.ValueExists('edTypeSmInfo')      then edTypeSmInfo.ItemIndex    :=Reg.ReadInteger('edTypeSmInfo');
                            if Reg.ValueExists('edTypeRzInfo')      then edTypeRzInfo.ItemIndex    :=Reg.ReadInteger('edTypeRzInfo');
                            if Reg.ValueExists('edTypeStInfo')      then edTypeStInfo.ItemIndex    :=Reg.ReadInteger('edTypeStInfo');
                            if Reg.ValueExists('edTypeKvInfo')      then edTypeKvInfo.ItemIndex    :=Reg.ReadInteger('edTypeKvInfo');
                            if Reg.ValueExists('edTypeAnInfo')      then edTypeAnInfo.ItemIndex    :=Reg.ReadInteger('edTypeAnInfo');

                  end;
                                              finally Reg.Free;
              end;

      End
      else begin
                ShowSch.Checked     :=true;
                ShowInSaldo.Checked  :=false;
                ShowOutSaldo.Checked :=false;
                ShowProgram.Checked :=false;
                ShowSmGr.Checked    :=false;
                ShowSm.Checked      :=false;
                ShowRz.Checked      :=false;
                ShowSt.Checked      :=false;
                ShowKv.Checked      :=false;
                ShowAn.Checked      :=false;
                edTypeSchInfo.ItemIndex   :=0;

                getSchInfo:=TpFibDataSet.Create(self);
                getSchInfo.Database:=workdatabase;
                getSchInfo.Transaction:=readTransaction;
                getSchInfo.SelectSQL.Text:='select * from PUB_SP_MAIN_SCH_INFO('+''''+DateToStr(DateBeg)+''''+','+Inttostr(id_sch)+')';
                getSchInfo.Open;
                if getSchInfo.RecordCount>0
                then begin
                          name_sch:=getSchInfo.FieldByName('SCH_TITLE').AsString;
                          num_sch:=getSchInfo.FieldByName('SCH_NUMBER').AsString;
                end;
                getSchInfo.Close;
                getSchInfo.Free;

      end;

      cxButtonEdit1.Text:=num_sch+' "'+name_sch+'"';
      TfrmMainResults(self.Owner).Panel1.Caption:=' Аналіз оборотів по рахунку '+num_sch+' "'+name_sch+'"';

      if (ShowSch.Checked=true) and (ShowKv.Checked=false) and (ShowSt.Checked=false) and (ShowRz.Checked=false)
        and (ShowSm.Checked=false) and (ShowSmGr.Checked=false) and (ShowProgram.Checked=false) and (ShowAn.Checked=false)
      then begin
                ShowInSaldo.Enabled:=true;
                ShowOutSaldo.Enabled:=true;
      end
      else begin
                ShowInSaldo.Enabled:=false;
                ShowOutSaldo.Enabled:=false;
      end;

end;

procedure TfrmGetConfInfo.cxButtonEdit1PropertiesButtonClick (Sender: TObject; AButtonIndex: Integer);
//var Res:Variant;
begin
  Res:=GlobalSpr.GetSch(self,
                        TfrmMainResults(self.Owner).WorkDatabase.handle,
                        fsNormal,
                        StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]),
                        DEFAULT_ROOT_ID,
                        0,
                        id_sch);
  if VarArrayDimCount(RES)>0
  then begin
       id_sch:=RES[0][0];
       cxButtonEdit1.Text:=VarToStr(RES[0][3])+' "'+RES[0][1]+'"';
       TfrmMainResults(self.Owner).Panel1.Caption:=' Аналіз оборотів по рахунку '+VarToStr(RES[0][3])+' "'+RES[0][1]+'"';
  end;
end;

procedure TfrmGetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetConfInfo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Reg:TRegistry;
  i:Int64;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey('\Software\cxPropertiesStore',true);
  if VarArrayDimCount(RES)>0
  then begin

//    i:=RES[0][0];
      Reg.WriteInteger('RES_0_0', strtoint(vartostr(id_sch)));
      Reg.WriteString ('RES_0_1', RES[0][1]);
      Reg.WriteString ('RES_0_3', RES[0][3]);
    end;
      Reg.WriteBool('ShowSch',     ShowSch.Checked);
        Reg.WriteBool('ShowInSaldo', ShowInSaldo.Checked);
        Reg.WriteBool('ShowOutSaldo',ShowOutSaldo.Checked);
      Reg.WriteBool('ShowProgram', ShowProgram.Checked);
      Reg.WriteBool('ShowSmGr',    ShowSmGr.Checked);
      Reg.WriteBool('ShowSm',      ShowSm.Checked);
      Reg.WriteBool('ShowRz',      ShowRz.Checked);
      Reg.WriteBool('ShowSt',      ShowSt.Checked);
      Reg.WriteBool('ShowKv',      ShowKv.Checked);
      Reg.WriteBool('ShowAn',      ShowAn.Checked);
      Reg.WriteInteger('edTypeSchInfo',    edTypeSchInfo.ItemIndex);
      Reg.WriteInteger('edTypeProgramInfo',edProgramInfo.ItemIndex);
      Reg.WriteInteger('edTypeSmGrInfo',   edTypeSmGrInfo.ItemIndex);
      Reg.WriteInteger('edTypeSmInfo',     edTypeSmInfo.ItemIndex);
      Reg.WriteInteger('edTypeRzInfo',     edTypeRzInfo.ItemIndex);
      Reg.WriteInteger('edTypeStInfo',     edTypeStInfo.ItemIndex);
      Reg.WriteInteger('edTypeKvInfo',     edTypeKvInfo.ItemIndex);
      Reg.WriteInteger('edTypeAnInfo',     edTypeAnInfo.ItemIndex);
      finally Reg.Free;
    end;
end;

procedure TfrmGetConfInfo.ShowSchPropertiesChange(Sender: TObject);
begin
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
            ShowInSaldo.Enabled:=true;
            ShowOutSaldo.Enabled:=true;
  end
  else begin
            ShowInSaldo.Enabled:=false;
            ShowOutSaldo.Enabled:=false;
  end
end;

procedure TfrmGetConfInfo.ShowProgramPropertiesChange(Sender: TObject);
begin
  if ShowProgram.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.ShowSmGrPropertiesChange(Sender: TObject);
begin
  if ShowSmGr.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.ShowSmPropertiesChange(Sender: TObject);
begin
  if ShowSm.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.ShowRzPropertiesChange(Sender: TObject);
begin
  if ShowRz.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.ShowStPropertiesChange(Sender: TObject);
begin
  if ShowSt.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.ShowKvPropertiesChange(Sender: TObject);
begin
  if ShowKv.Checked=true then begin
      ShowInSaldo.Enabled:=false;
      ShowOutSaldo.Enabled:=false;
  end;
  if (ShowSch.Checked) and (ShowProgram.Checked=false) and (ShowSmGr.Checked=false)
    and (ShowSm.Checked=false) and (ShowRz.Checked=false) and (ShowSt.Checked=false) and (ShowKv.checked=false) and (ShowAn.Checked=false)
  then begin
      ShowInSaldo.Enabled:=true;
      ShowOutSaldo.Enabled:=true;
  end;
end;

procedure TfrmGetConfInfo.EscExecute(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

procedure TfrmGetConfInfo.Action1Execute(Sender: TObject);
begin
  cxButtonEdit1PropertiesButtonClick(self,0);
end;

end.
