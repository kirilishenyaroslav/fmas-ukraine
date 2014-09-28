unit GetProvInfoWizardAn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, cxStyles, cxLookAndFeelPainters, StdCtrls, cxButtons,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB,
  cxDBData, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxControls, cxGridCustomView, cxGrid, cxClasses,
  pFibStoredProc, FIBDataSet, pFIBDataSet, ActnList;

type
  TfrmWizardAn = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    cxButton1: TcxButton;
    HeaderPanel: TPanel;
    StyleRepository: TcxStyleRepository;
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
    cxErrorStyle: TcxStyle;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
    cxGrid2: TcxGrid;
    cxGrid2DBTableView1: TcxGridDBTableView;
    cxGrid2DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn4: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn5: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn6: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn7: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn8: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn9: TcxGridDBColumn;
    cxGrid2DBTableView1DBColumn10: TcxGridDBColumn;
    cxGrid2Level1: TcxGridLevel;
    ColAnInfoDataSet: TpFIBDataSet;
    AnValuesDataSet: TpFIBDataSet;
    AnValuesDataSource: TDataSource;
    CancelButton: TcxButton;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    procedure cxButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure cxGrid2DBTableView1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    id_sch:Int64;
    is_dt       :Boolean;
    procedure ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
    procedure ConfigureAnGrid;
    { Public declarations }
  end;


implementation

uses GetProvInfoWizard,GetProvInfoWizardResources;

{$R *.dfm}
procedure TfrmWizardAn.ConfigureAnGrid;
var i:Integer;
begin
     if ColAnInfoDataSet.Active then ColAnInfoDataSet.Close;
     ColAnInfoDataSet.SelectSQL.Text:='SELECT  *  FROM PUB_SPR_ANALITIC';
     ColAnInfoDataSet.Open;
     ColAnInfoDataSet.FetchAll;
     ColAnInfoDataSet.First;
     for i:=0 to ColAnInfoDataSet.RecordCount-1 do
     begin
          if ColAnInfoDataSet.FieldByName('ID_TYPE_ENUM').Value=NULL
          then begin
          end
          else begin
            cxGrid2DBTableView1.Columns[i].Caption:=ColAnInfoDataSet.FieldByName('NOTE').AsString;
          end;
          cxGrid2DBTableView1.Columns[i].Visible:=false;
          ColAnInfoDataSet.Next;
     end;
     AnValuesDataSet.SelectSQL.Text:=' SELECT * FROM PUB_DT_SCH_ANALITIC_SELECT_EX2('+IntToStr(ID_SCH)+')';
     AnValuesDataSet.Open;
end;

procedure TfrmWizardAn.ConfigureAnGridBySch(ID_SCH:Integer;View:TcxGridDBTableView);
var ConfigProc:TpFibStoredProc;
begin
      ConfigProc:=TpFibStoredProc.Create(self);
      ConfigProc.Database:=TfrmProvInfoWizard(owner).WorkDatabase;
      ConfigProc.Transaction:=TfrmProvInfoWizard(owner).ReadTransaction;
      ConfigProc.StoredProcName:='MBOOK_ANALITIC_CONFIGURE';
      ConfigProc.Prepare;
      ConfigProc.ParamByName('ID_SCH').AsInt64:=ID_SCH;
      ConfigProc.ExecProc;
      if ConfigProc.ParamByName('AN1_IS_VALID').AsInteger =1
      then View.Columns[0].Visible:=true
      else View.Columns[0].Visible:=false;
      if ConfigProc.ParamByName('AN2_IS_VALID').AsInteger =1
      then View.Columns[1].Visible:=true
      else View.Columns[1].Visible:=false;
      if ConfigProc.ParamByName('AN3_IS_VALID').AsInteger =1
      then View.Columns[2].Visible:=true
      else View.Columns[2].Visible:=false;
      if ConfigProc.ParamByName('AN4_IS_VALID').AsInteger =1
      then View.Columns[3].Visible:=true
      else View.Columns[3].Visible:=false;
      if ConfigProc.ParamByName('AN5_IS_VALID').AsInteger =1
      then View.Columns[4].Visible:=true
      else View.Columns[4].Visible:=false;
      if ConfigProc.ParamByName('AN6_IS_VALID').AsInteger =1
      then View.Columns[5].Visible:=true
      else View.Columns[5].Visible:=false;
      if ConfigProc.ParamByName('AN7_IS_VALID').AsInteger =1
      then View.Columns[6].Visible:=true
      else View.Columns[6].Visible:=false;
      if ConfigProc.ParamByName('AN8_IS_VALID').AsInteger =1
      then View.Columns[7].Visible:=true
      else View.Columns[7].Visible:=false;
      if ConfigProc.ParamByName('AN9_IS_VALID').AsInteger =1
      then View.Columns[8].Visible:=true
      else View.Columns[8].Visible:=false;
      if ConfigProc.ParamByName('AN10_IS_VALID').AsInteger=1
      then View.Columns[9].Visible:=true
      else View.Columns[9].Visible:=false;
      ConfigProc.Free;
end;

procedure TfrmWizardAn.cxButton1Click(Sender: TObject);
begin
     if AnValuesDataSet.RecordCount>0
     then ModalResult:=mrYes;
end;

procedure TfrmWizardAn.FormShow(Sender: TObject);
begin
     self.Caption        :=GetProvInfoWizardResources.ANALITIC_FORM_CAPTION[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     HeaderPanel.Caption :=GetProvInfoWizardResources.ANALITIC_FORM_HEAD_PANEL[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     CancelButton.Caption:=GetProvInfoWizardResources.ANALITIC_FORM_CANCEL_BUT[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];

     ColAnInfoDataSet.Database    :=TfrmProvInfoWizard(owner).WorkDatabase;
     ColAnInfoDataSet.Transaction :=TfrmProvInfoWizard(owner).ReadTransaction;
     AnValuesDataSet.Database    :=TfrmProvInfoWizard(owner).WorkDatabase;
     AnValuesDataSet.Transaction :=TfrmProvInfoWizard(owner).ReadTransaction;

     if is_dt
     then self.Caption:=self.Caption+ ' ¹'+TfrmProvInfoWizard(owner).edDbSchNum_x+' "'+TfrmProvInfoWizard(owner).edDbSchTitle_x+'"'
     else self.Caption:=self.Caption+ ' ¹'+TfrmProvInfoWizard(owner).edKrSchNum_x+' "'+TfrmProvInfoWizard(owner).edKrSchTitle_x+'"';

     ConfigureAnGrid;
     ConfigureAnGridBySch(id_sch,cxGrid2DBTableView1);
end;

procedure TfrmWizardAn.CancelButtonClick(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmWizardAn.Action1Execute(Sender: TObject);
begin
     if AnValuesDataSet.RecordCount>0
     then ModalResult:=mrYes;
end;

procedure TfrmWizardAn.Action2Execute(Sender: TObject);
begin
     ModalResult:=mrNo;
end;

procedure TfrmWizardAn.cxGrid2DBTableView1DblClick(Sender: TObject);
begin
     if AnValuesDataSet.RecordCount>0
     then ModalResult:=mrYes;
end;

end.
