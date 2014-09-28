unit UDocPrinting;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxMaskEdit, cxButtonEdit, cxTextEdit, cxControls, cxContainer, cxEdit,
  cxCheckBox, cxRadioGroup, DB, FIBDataSet, pFIBDataSet, frxClass, frxDBSet,
  ComCtrls, UShowProgressThread, UPrintFormThread;

type
  TfrmDocPrinting = class(TForm)
    Panel1: TPanel;
    cxButton1: TcxButton;
    cxButton2: TcxButton;
    PrintDataSet: TpFIBDataSet;
    PrintDataSource: TDataSource;
    frxDBDataset1: TfrxDBDataset;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel2: TPanel;
    cxFixedBuValues: TcxCheckBox;
    EdSm: TcxTextEdit;
    EdRz: TcxTextEdit;
    EdSt: TcxButtonEdit;
    cxFixedTypeCalcValues: TcxCheckBox;
    RGTypeCalc: TcxRadioGroup;
    RGTypeStud: TcxRadioGroup;
    cxFixedTypeStudValues: TcxCheckBox;
    TabSheet2: TTabSheet;
    CheckDep: TcxCheckBox;
    EdDepartments: TcxButtonEdit;
    WaitPanel: TPanel;
    ProgressBar1: TProgressBar;
    cxButton3: TcxButton;
    Label1: TLabel;
    frxReport1: TfrxReport;
    procedure cxButton1Click(Sender: TObject);
    procedure cxButton2Click(Sender: TObject);
    procedure cxFixedBuValuesPropertiesChange(Sender: TObject);
    procedure cxFixedTypeCalcValuesPropertiesChange(Sender: TObject);
    procedure cxFixedTypeStudValuesPropertiesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdStPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure RGTypeCalcPropertiesChange(Sender: TObject);
    procedure RGTypeStudPropertiesChange(Sender: TObject);
    procedure CheckDepPropertiesChange(Sender: TObject);
    procedure EdDepartmentsPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure cxButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
     { Public declarations }
    Id_Report:Integer;

    FIXED_ID_SM : String;
    FIXED_ID_RZ : String;
    FIXED_ID_ST : String;
    FIXED_ID_KEKV : String;
    FIXED_TYPE_CALC : String;
    FIXED_TYPE_STUD : String;
    FIXED_ID_DEPARTMENT : String;

    Progress_Thread:TShowProgressThread;
    GePrintInfo_Thread:TPrintFormThread;
    procedure OnTerminateCalcThread(Sender:TObject);


    constructor Create(AOwner:TComponent;Id_Report:Integer);reintroduce;
    function CheckData:Boolean;
  end;


implementation

uses UMainAccounts, GlobalSPR, uCommonSp;

{$R *.dfm}

procedure TfrmDocPrinting.cxButton1Click(Sender: TObject);
begin
     WaitPanel.Visible:=true;
     WaitPanel.Update;
     Application.ProcessMessages;

     Progress_Thread                :=TShowProgressThread.Create(true,ProgressBar1);
     Progress_Thread.FreeOnTerminate:=true;
     Progress_Thread.Priority       :=tpNormal;
     Progress_Thread.Resume;

     GePrintInfo_Thread                :=TPrintFormThread.Create(true,self);
     GePrintInfo_Thread.FreeOnTerminate:=true;
     GePrintInfo_Thread.Priority       :=tpNormal;
     GePrintInfo_Thread.OnTerminate    :=OnTerminateCalcThread;
     GePrintInfo_Thread.Resume;
end;

procedure TfrmDocPrinting.cxButton2Click(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmDocPrinting.cxFixedBuValuesPropertiesChange(Sender: TObject);
begin
     EdSm.Enabled:=cxFixedBuValues.Checked;
     EdRz.Enabled:=cxFixedBuValues.Checked;
     EdSt.Enabled:=cxFixedBuValues.Checked;
end;

procedure TfrmDocPrinting.cxFixedTypeCalcValuesPropertiesChange(
  Sender: TObject);
begin
     RGTypeCalc.Enabled:=cxFixedTypeCalcValues.Checked;
     if RGTypeCalc.Enabled
     then begin
               FIXED_TYPE_CALC:=IntToStr(RGTypecalc.ItemIndex);
     end
     else begin
               FIXED_TYPE_CALC:='-1';
     end;
end;

procedure TfrmDocPrinting.cxFixedTypeStudValuesPropertiesChange(
  Sender: TObject);
begin
     RGTypeStud.Enabled:=cxFixedTypeStudValues.Checked;
     if RGTypeStud.Enabled
     then begin
               FIXED_TYPE_STUD:=IntToStr(RGTypeStud.ItemIndex);
     end
     else begin
               FIXED_TYPE_STUD:='-1';
     end;
end;

procedure TfrmDocPrinting.FormCreate(Sender: TObject);
begin
     FIXED_ID_SM     :='-1';
     FIXED_ID_RZ     :='-1';
     FIXED_ID_ST     :='-1';
     FIXED_ID_KEKV   :='-1';
     FIXED_TYPE_CALC :='-1';
     FIXED_TYPE_STUD :='-1';

     PrintDataSet.Database:=TfrmAccountMain(owner).WorkDatabase;
     PrintDataSet.Transaction:=TfrmAccountMain(owner).ReadTransaction;
end;

function TfrmDocPrinting.CheckData: Boolean;
begin
     Result:=true;
end;

constructor TfrmDocPrinting.Create(AOwner: TComponent; Id_Report: Integer);
begin
     inherited Create(AOwner);
     self.Id_Report:=Id_Report;
end;

procedure TfrmDocPrinting.OnTerminateCalcThread(Sender: TObject);
begin
     if Assigned(Progress_Thread) then Progress_Thread.Terminate;
     WaitPanel.Visible:=false;
     frxReport1.ShowPreparedReport;
end;

procedure TfrmDocPrinting.EdStPropertiesButtonClick(Sender: TObject;
  AButtonIndex: Integer);
var id:Variant;
begin
    id:=GlobalSPR.GetSmets(self,TfrmAccountMain(owner).WorkDatabase.Handle,TfrmAccountMain(owner).AccDataSet.FielDByName('DATE_BEG').Value,psmRazdSt);
    if VarArrayDimCount(id)>0
    then begin
              FIXED_ID_SM:=id[0];
              FIXED_ID_RZ:=id[1];
              FIXED_ID_ST:=id[2];

              EdSm.Text:=VarToStr(id[9])+' "'+VarToStr(id[6])+'"';
              EdRz.Text:=VarToStr(id[7])+' "'+VarToStr(id[4])+'"';
              EdSt.Text:=VarToStr(id[8])+' "'+VarToStr(id[5])+'"';
    end;
end;

procedure TfrmDocPrinting.RGTypeCalcPropertiesChange(Sender: TObject);
begin
     FIXED_TYPE_CALC:=IntToStr(RGTypecalc.ItemIndex);
end;

procedure TfrmDocPrinting.RGTypeStudPropertiesChange(Sender: TObject);
begin
     FIXED_TYPE_STUD:=IntToStr(RGTypeStud.ItemIndex);
end;

procedure TfrmDocPrinting.CheckDepPropertiesChange(Sender: TObject);
begin
     EdDepartments.Enabled:=CheckDep.Checked;
end;

procedure TfrmDocPrinting.EdDepartmentsPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
  var sp: TSprav;
begin
        sp := GetSprav('SpDepartment');
        if sp <> nil then
        begin
            // заполнить входные параметры
            with sp.Input do
            begin
                Append;
                FieldValues['DBHandle'] := Integer(TfrmAccountMain(owner).WorkDatabase.Handle);
                FieldValues['ShowStyle'] := 0;
                FieldValues['Select'] := 1;
                FieldValues['Actual_Date'] := TfrmAccountMain(owner).AccDataSet.FielDByName('DATE_BEG').Value;
                Post;
            end;
        end;
        sp.Show;
        if sp.Output = nil then
            ShowMessage('BUG: Output is NIL!!!')
        else
        if not sp.Output.IsEmpty then
           begin
            EdDepartments.Text := varToStr(sp.Output['NAME_FULL']);
            FIXED_ID_DEPARTMENT :=VarToStr(sp.Output['ID_DEPARTMENT']);
           end;
        sp.Free;
end;

procedure TfrmDocPrinting.cxButton3Click(Sender: TObject);
begin
     GePrintInfo_Thread.Terminate;
     WaitPanel.Visible:=false;
end;

end.
