unit UP_uMovingsRedact;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFControl, uBoolControl, uLabeledFControl, uDateControl,
  StdCtrls, Buttons, uIntControl, uSpravControl, uCharControl, uFormControl,
  uFloatControl, uInvisControl, ActnList, cxCheckBox, cxDBEdit, cxControls,
  cxContainer, cxEdit, cxTextEdit, DB, FIBDataSet, pFIBDataSet, ExtCtrls,
  cxMaskEdit, cxDropDownEdit, cxCalendar, cxLookAndFeelPainters, cxButtons,
  pFibStoredProc;

type
  TMovingsRedact_Form = class(TForm)
    CancelButton: TBitBtn;
    ActionList1: TActionList;
    Action1: TAction;
    cxDBTextEdit1: TcxDBTextEdit;
    Label1: TLabel;
    cxDBCheckBox1: TcxDBCheckBox;
    Label2: TLabel;
    cxDBTextEdit2: TcxDBTextEdit;
    Label3: TLabel;
    cxDBTextEdit3: TcxDBTextEdit;
    Label4: TLabel;
    cxDBTextEdit4: TcxDBTextEdit;
    Label5: TLabel;
    cxDBTextEdit5: TcxDBTextEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label11: TLabel;
    cxDBTextEdit11: TcxDBTextEdit;
    infoDataSet: TpFIBDataSet;
    infoDataSource: TDataSource;
    Bevel1: TBevel;
    Bevel2: TBevel;
    cxDBDateEdit1: TcxDBDateEdit;
    cxDBDateEdit2: TcxDBDateEdit;
    cxButton1: TcxButton;
    Action2: TAction;
    procedure CancelButtonClick(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  	Mode:TFormMode;
    constructor Create(AOwner: TComponent; Mode:TFormMode; where: Int64);
        reintroduce;
  end;

implementation


{$R *.dfm}

uses SpCommon, SpFormUnit, UP_uMovingsFrame,UAccDateEdit;

constructor TMovingsRedact_Form.Create(AOwner: TComponent; Mode:TFormMode; where: Int64);
begin
     inherited Create(AOwner);
     Self.Mode:=Mode;
     infoDataSet.Database   :=TfmPCardMovingsPage(Owner).DB;
     infoDataSet.Transaction:=TfmPCardMovingsPage(Owner).ReadTransaction;
     infoDataSet.SelectSQL.Text:='Select * from UP_KER_MAN_MOVING_SEL_EXT_INFO('+IntToStr(where)+')';
     infoDataSet.Open;
end;


procedure TMovingsRedact_Form.CancelButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TMovingsRedact_Form.Action2Execute(Sender: TObject);
begin
     if infoDataSet.FieldByName('ID_ACCEPT_DOG').value<>null
     then begin
               cxButton1.Visible:=true;
     end;          
end;

procedure TMovingsRedact_Form.cxButton1Click(Sender: TObject);
var T:TfrmAccEdit;
    UpDateSP:TpFibStoredProc;
begin
     T:=TfrmAccEdit.Create(self);
     T.DateBeg.Date:=cxDBDateEdit1.Date;
     T.DateEnd.Date:=cxDBDateEdit2.Date;
     if T.ShowModal=mrYes
     then begin
               UpDateSP:=TpFibStoredProc.Create(self);
               UpDateSP.Database:=TfmPCardMovingsPage(Owner).DB;
               UpDateSP.Transaction:=TfmPCardMovingsPage(Owner).WriteTransaction;
               TfmPCardMovingsPage(Owner).WriteTransaction.StartTransaction;
               UpDateSP.StoredProcName:='UP_KER_MOVING_ACCEPTION_UPD';
               UpDateSP.Prepare;
               UpDateSP.ParamByName('ID_ACCEPT_DOG').AsInt64:=StrToInt64(infoDataSet.FieldByName('ID_ACCEPT_DOG').AsString);
               UpDateSP.ParamByName('DATE_BEG').Value       :=T.DateBeg.EditValue;
               UpDateSP.ParamByName('DATE_END').Value       :=T.DateEnd.EditValue;
               UpDateSP.ExecProc;
               TfmPCardMovingsPage(Owner).WriteTransaction.Commit;
               UpDateSP.Close;
               UpDateSP.Free;
               infoDataSet.CloseOpen(true);
     end;
     T.Free;
end;

end.
