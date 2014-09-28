unit uView_pers_acc_inf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxClasses, ImgList, StdCtrls, cxButtons,
  cxContainer, cxLabel, cxGroupBox, uCommon_Types, uCommon_Funcs, ExtCtrls,
  FIBDatabase, pFIBDatabase, FIBDataSet, pFIBDataSet, cxTextEdit, cxDBEdit,
  uCommon_Messages, FIBQuery, pFIBQuery, pFIBStoredProc, cxCheckBox,
  cxRadioGroup;

type
  TfrmViewNachisl = class(TForm)
    cxGroupBox1: TcxGroupBox;
    lblKodMachine: TcxLabel;
    lblRegion: TcxLabel;
    cxLabel4: TcxLabel;
    cxLabel6: TcxLabel;
    cxLabel7: TcxLabel;
    btnPrint: TcxButton;
    lblFIO: TcxLabel;
    lblTenunts: TcxLabel;
    lblNumPriv: TcxLabel;
    lblPriv: TcxLabel;
    lblCustService: TcxLabel;
    cxGroupBox2: TcxGroupBox;
    btnYear: TcxButton;
    btnMonth: TcxButton;
    btnService: TcxButton;
    bntTypeSum: TcxButton;
    cxGroupBox3: TcxGroupBox;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    NachGrid: TcxGrid;
    NachGridDBView: TcxGridDBTableView;
    NachGridLevel: TcxGridLevel;
    NachDB: TpFIBDatabase;
    ConstDSet: TpFIBDataSet;
    NTransRead: TpFIBTransaction;
    Panel1: TPanel;
    ClientAccountDSet: TpFIBDataSet;
    NachDSet: TpFIBDataSet;
    NachDS: TDataSource;
    NTransWrite: TpFIBTransaction;
    RegionEdit: TcxDBTextEdit;
    ClientDS: TDataSource;
    StreetEdit: TcxDBTextEdit;
    CityAreaEdit: TcxDBTextEdit;
    FioEdit: TcxDBTextEdit;
    NumTenantsEdit: TcxDBTextEdit;
    NumPrivEdit: TcxDBTextEdit;
    ProcPrivEdit: TcxDBTextEdit;
    CustServiceEdit: TcxDBTextEdit;
    ClientAccountEdit: TcxDBTextEdit;
    InputEdit: TcxDBTextEdit;
    KodMachineEdit: TcxTextEdit;
    ColumnYear: TcxGridDBColumn;
    ColumnMonth: TcxGridDBColumn;
    ColumnNach: TcxGridDBColumn;
    ColumnPayment: TcxGridDBColumn;
    ColumnSubsidy: TcxGridDBColumn;
    ColumnSummary: TcxGridDBColumn;
    ColumnMonthInt: TcxGridDBColumn;
    StorProc: TpFIBStoredProc;
    ColumnGroupBalance: TcxGridDBColumn;
    chYear: TcxCheckBox;
    chMonth: TcxCheckBox;
    chGroupBalance: TcxCheckBox;
    chSum: TcxCheckBox;
    ColumnSummaryIntake: TcxGridDBColumn;
    ColumnWaterIntake: TcxGridDBColumn;
    ColumnWaterIntakePriv: TcxGridDBColumn;
    NachGroupBox: TRadioGroup;
    FlagBox: TRadioGroup;
    ColumnCostWaterPriv: TcxGridDBColumn;
    procedure btnYearClick(Sender: TObject);
    procedure btnMonthClick(Sender: TObject);
    procedure btnServiceClick(Sender: TObject);
    procedure bntTypeSumClick(Sender: TObject);
    procedure NachGroupBoxClick(Sender: TObject);
    procedure FlagBoxClick(Sender: TObject);
  private
    { Private declarations }
    KodMachine:Integer;
    procedure BsGetNachInfo;
  public
    { Public declarations }
    constructor Create(AParameter:TBsSimpleParams);reintroduce;
  end;

var
  frmViewNachisl: TfrmViewNachisl;

implementation

{$R *.dfm}

constructor TfrmViewNachisl.Create(AParameter:TBsSimpleParams);
begin
  try
    inherited Create(AParameter.Owner);
    KodMachine:=AParameter.ID_Locate;
    NachDB.Handle:=AParameter.Db_Handle;

    StorProc.StoredProcName:='BS_ACCRUAL_CLIENT_ACCOUNT';
    StorProc.Transaction.StartTransaction;
    StorProc.Prepare;
    StorProc.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
    StorProc.ParamByName('FLAG_ACCOUNT').AsShort:=0;
    try
       StorProc.ExecProc;
       StorProc.Transaction.Commit;
    except on E:Exception do
           begin
               bsShowMessage(Application.Title, E.Message, mtInformation, [mbOK]);
               StorProc.Transaction.Rollback;
           end;
    end;

    if ConstDSet.Active then ConstDSet.Close;
    ConstDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_CONSTS';
    ConstDSet.Open;

    if ClientAccountDSet.Active then ClientAccountDSet.Close;
    ClientAccountDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_CLIENT_ACCOUNT_INFO(:KOD_MACHINE, :ACT_DATE)';
    ClientAccountDSet.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
    ClientAccountDSet.ParamByName('ACT_DATE').AsDate:=Date;
    ClientAccountDSet.Open;
    KodMachineEdit.Text:=IntToStr(KodMachine);

    {if NachDSet.Active then NachDSet.Close;
    NachDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_NACHISL(:KOD_MACHINE, :KOD_BEG, :KOD_END, :FLAG)';
    NachDSet.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
    NachDSet.ParamByName('KOD_BEG').Value:=null;
    NachDSet.ParamByName('KOD_END').Value:=null;
    NachDSet.ParamByName('FLAG').AsShort:=0;
    NachDSet.Open;      }
    BsGetNachInfo;
  except on E:Exception do
         begin
            bsShowMessage('гтрур!', E.Message, mtInformation, [mbOK]);
         end;
  end;
end;

procedure TfrmViewNachisl.BsGetNachInfo;
begin
    if NachDSet.Active then NachDSet.Close;
    NachDSet.SQLs.SelectSQL.Text:='SELECT DISTINCT * FROM BS_GET_NACHISL_INFO(:KOD_MACHINE, :KOD_BEG, '+
                                  ':KOD_END, :FLAG, :FLAG_YEAR, :FLAG_MONTH, :FLAG_GROUP_BALANCE, :FLAG_SUMM)';
    NachDSet.ParamByName('KOD_MACHINE').AsInteger:=KodMachine;
    NachDSet.ParamByName('KOD_BEG').Value:=null;
    NachDSet.ParamByName('KOD_END').Value:=null;
    NachDSet.ParamByName('FLAG').AsShort:=FlagBox.ItemIndex;
    NachDSet.ParamByName('FLAG_YEAR').AsShort:=Integer(Boolean(chYear.Checked));
    NachDSet.ParamByName('FLAG_MONTH').AsShort:=Integer(Boolean(chMonth.Checked));
    NachDSet.ParamByName('FLAG_GROUP_BALANCE').AsShort:=Integer(Boolean(chGroupBalance.Checked));
    NachDSet.ParamByName('FLAG_SUMM').AsShort:=Integer(Boolean(chSum.Checked));
    NachDSet.Open;
end;

procedure TfrmViewNachisl.btnYearClick(Sender: TObject);
begin
   chYear.Checked:=not chYear.Checked;
   ColumnYear.Visible:=chYear.Checked;
   BsGetNachInfo;
end;

procedure TfrmViewNachisl.btnMonthClick(Sender: TObject);
begin
   chMonth.Checked:=not chMonth.Checked;
   ColumnMonth.Visible:=chMonth.Checked;
   BsGetNachInfo;
end;

procedure TfrmViewNachisl.btnServiceClick(Sender: TObject);
begin
   chGroupBalance.Checked:=not chGroupBalance.Checked;
   ColumnGroupBalance.Visible:=chGroupBalance.Checked;
   BsGetNachInfo;
end;

procedure TfrmViewNachisl.bntTypeSumClick(Sender: TObject);
begin
   chSum.Checked:=not chSum.Checked;
   ColumnNach.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnPayment.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnSubsidy.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnCostWaterPriv.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnSummary.Visible:=(NachGroupBox.ItemIndex=0);
   ColumnWaterIntake.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=1));
   ColumnWaterIntakePriv.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=1));
   ColumnSummaryIntake.Visible:=(NachGroupBox.ItemIndex=1);
end;

procedure TfrmViewNachisl.NachGroupBoxClick(Sender: TObject);
begin
   ColumnNach.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnPayment.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnSubsidy.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnCostWaterPriv.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=0));
   ColumnSummary.Visible:=(NachGroupBox.ItemIndex=0);
   ColumnWaterIntake.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=1));
   ColumnWaterIntakePriv.Visible:=((chSum.Checked) and (NachGroupBox.ItemIndex=1));
   ColumnSummaryIntake.Visible:=(NachGroupBox.ItemIndex=1);
end;

procedure TfrmViewNachisl.FlagBoxClick(Sender: TObject);
begin
   BsGetNachInfo;
end;

end.
