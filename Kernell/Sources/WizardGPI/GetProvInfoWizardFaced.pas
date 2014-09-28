unit GetProvInfoWizardFaced;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, ExtCtrls, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, cxGridBandedTableView,
  cxGridDBBandedTableView, cxLookAndFeelPainters, StdCtrls, cxButtons,
  FIBDataSet, pFIBDataSet, cxContainer, cxDBEdit, ActnList, cxMemo;

type
  TfrmGetFaced = class(TForm)
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView2: TcxGridDBTableView;
    cxGrid1DBTableView2DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView2DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView3: TcxGridDBTableView;
    cxGrid1DBTableView3DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn3: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn4: TcxGridDBColumn;
    cxGrid1DBTableView3DBColumn5: TcxGridDBColumn;
    Panel1: TPanel;
    HeaderPanel: TPanel;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1DBBandedTableView1: TcxGridDBBandedTableView;
    cxGrid1DBBandedTableView1DBBandedColumn4: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn5: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn6: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn7: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn8: TcxGridDBBandedColumn;
    OKButton: TcxButton;
    FacedDataSet: TpFIBDataSet;
    FacedDataSource: TDataSource;
    Label2: TLabel;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    cxGrid1DBBandedTableView1DBBandedColumn1: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn2: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn3: TcxGridDBBandedColumn;
    cxGrid1DBBandedTableView1DBBandedColumn9: TcxGridDBBandedColumn;
    CloseButton: TcxButton;
    Panel3: TPanel;
    Label1: TLabel;
    cxDBMemo1: TcxDBMemo;
    cxStyle3: TcxStyle;
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBBandedTableView1DblClick(Sender: TObject);
    procedure Action1Execute(Sender: TObject);
    procedure Action2Execute(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    ID_OPER     : Int64;
    ACTUAL_DATE : TDateTime;
    { Public declarations }
  end;


implementation

uses GetProvInfoWizard, GetProvInfoWizardResources;
{$R *.dfm}

procedure TfrmGetFaced.OKButtonClick(Sender: TObject);
begin
     if FacedDataSet.RecordCount>0
     then ModalResult:=mrYes;
end;

procedure TfrmGetFaced.FormShow(Sender: TObject);
begin
     self.Caption        :=GetProvInfoWizardResources.FACED_FORM_CAPTION[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     HeaderPanel.Caption :=GetProvInfoWizardResources.FACED_FORM_HEADER_PANEL[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     Label1.Caption      :=GetProvInfoWizardResources.FACED_FORM_BASE_DOCUMENT[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     OKButton.Caption    :=GetProvInfoWizardResources.FACED_FORM_OK_BUTTON[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     CloseButton.Caption :=GetProvInfoWizardResources.FACED_FORM_CLOSE_BUTTON[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];

     cxGrid1DBBandedTableView1DBBandedColumn1.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN1[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn2.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN2[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn3.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN3[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn4.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN4[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn5.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN5[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn6.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN6[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn7.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN7[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn8.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN8[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];
     cxGrid1DBBandedTableView1DBBandedColumn9.Caption:=GetProvInfoWizardResources.FACED_GRID_COLUMN9[TfrmProvInfoWizard(owner).PSTRU^.ID_LANGUAGE];

     FacedDataSet.Database      :=TfrmProvInfoWizard(Owner).WorkDatabase;
     FacedDataSet.Transaction   :=TfrmProvInfoWizard(Owner).ReadTransaction;
     FacedDataSet.SelectSQL.Text:=' SELECT * FROM BU_GET_FACED_INFO_FOR_WIZARD('+IntToStr(ID_OPER)+','+''''+DateTimeToStr(ACTUAL_DATE)+''''+')';
     FacedDataSet.Open;
end;

procedure TfrmGetFaced.cxGrid1DBBandedTableView1DblClick(Sender: TObject);
begin
     OKButtonClick(self);
end;

procedure TfrmGetFaced.Action1Execute(Sender: TObject);
begin
     OKButtonClick(self);
end;

procedure TfrmGetFaced.Action2Execute(Sender: TObject);
begin
    ModalResult:=mrNoToAll;
end;

procedure TfrmGetFaced.CloseButtonClick(Sender: TObject);
begin
    ModalResult:=mrNoToAll;
end;

end.
