unit UACConfigureForm;

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
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    edTypeRzInfo: TcxRadioGroup;
    edTypeKvInfo: TcxRadioGroup;
    cxButton2: TcxButton;
    FormStorage1: TFormStorage;
    cbMonthBeg: TcxComboBox;
    cbYearBeg: TcxComboBox;
    cbMonthEnd: TcxComboBox;
    cbYearEnd: TcxComboBox;
    ActionList1: TActionList;
    Esc: TAction;
    Action1: TAction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    ShowRz: TcxRadioButton;
    ShowKv: TcxRadioButton;
    cbWithDates: TcxCheckBox;
    ThruFR: TcxRadioGroup;
    Only_ch_period: TcxCheckBox;
    procedure cxButton1Click (Sender: TObject);
    procedure FormCreate (Sender: TObject);
    procedure cxButton2Click (Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EscExecute(Sender: TObject);
  private
    { Private declarations }
    fnotcheckdates:Boolean;
  public
    { Public declarations }
    DateBeg: TDateTime;
    DateEnd: TDateTime;
    constructor Create(AOwner:TComponent;DBHandle:TISC_DB_HANDLE;db,de:Tdatetime;is_kassa:Boolean; notcheckdates:Boolean=true);overload;
  end;

implementation

uses GlobalSpr,Resources_unitb,BaseTypes,DateUtils;
{$R *.dfm}

constructor TfrmGetConfInfo.Create(AOwner: TComponent; DBHandle:TISC_DB_HANDLE; db,de:TdateTime;is_kassa:Boolean; notcheckdates:Boolean=true);
begin
     inherited Create(AOwner);
     workdatabase.handle:=dbhandle;
     readtransaction.starttransaction;
     cbWithDates.Visible:=not is_kassa;
     ThruFR.Visible:=not is_kassa;
     fnotcheckdates:=notcheckdates;
     DateBeg:=db;
     DateEnd:=de;
end;

procedure TfrmGetConfInfo.cxButton1Click(Sender: TObject);
begin
     DateSeparator:='.';
     DateBeg:=StrToDate('01.'+IntToStr(cbMonthBeg.ItemIndex+1)+'.'+cbYearBeg.Properties.Items[cbYearBeg.ItemIndex]);
     DateEnd:=StrToDate('01.'+IntToStr(cbMonthEnd.ItemIndex+1)+'.'+cbYearEnd.Properties.Items[cbYearEnd.ItemIndex]);

     if fnotcheckdates
     then begin
               if (DateEnd<DateBeg) then agShowMessage('���� ��������� �� ���� ���� ������ �� ���� �������')
               else begin
                        DateEnd:=IncMonth(DateEnd,1)-1;
                        ModalResult:=mrYes;
               end;
     end
     else begin
               ModalResult:=mrYes;
     end;
end;

procedure TfrmGetConfInfo.FormCreate(Sender: TObject);
var
I:      Integer;
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
      if TForm(Self.Owner).FormStyle<>fsNormal
      then begin
                      try
                            if Reg.ValueExists('ShowRz')       then ShowRz.Checked      :=Reg.ReadBool('ShowRz');
                            if Reg.ValueExists('ShowKv')       then ShowKv.Checked      :=Reg.ReadBool('ShowKv');
                            if Reg.ValueExists('edTypeRzInfo')      then edTypeRzInfo.ItemIndex    :=Reg.ReadInteger('edTypeRzInfo');
                            if Reg.ValueExists('edTypeKvInfo')      then edTypeKvInfo.ItemIndex    :=Reg.ReadInteger('edTypeKvInfo');

                                              finally Reg.Free;
              end;

      End
      else begin
                ShowRz.Checked      :=false;
                ShowKv.Checked      :=false;
      end;

end;

procedure TfrmGetConfInfo.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmGetConfInfo.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Reg:TRegistry;
begin
  Reg:=TRegistry.Create;
  Reg.RootKey:=HKEY_CURRENT_USER;
    try
      Reg.OpenKey('\Software\cxPropertiesStore',true);
      Reg.WriteBool('ShowRz',      ShowRz.Checked);
      Reg.WriteBool('ShowKv',      ShowKv.Checked);
      Reg.WriteInteger('edTypeRzInfo',     edTypeRzInfo.ItemIndex);
      Reg.WriteInteger('edTypeKvInfo',     edTypeKvInfo.ItemIndex);
      finally Reg.Free;
    end;
end;

procedure TfrmGetConfInfo.EscExecute(Sender: TObject);
begin
  ModalResult:=mrNo;
end;

end.
