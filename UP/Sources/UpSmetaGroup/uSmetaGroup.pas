unit uSmetaGroup;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, cxClasses, ExtCtrls, FIBDatabase, pFIBDatabase,
    FIBDataSet, pFIBDataSet, uCommonSp, IBase, StdCtrls, Buttons;

type
    TfmSmetaGroup = class(TForm)
        StyleRepository: TcxStyleRepository;
        stBackground: TcxStyle;
        stContent: TcxStyle;
        stContentEven: TcxStyle;
        stContentOdd: TcxStyle;
        stFilterBox: TcxStyle;
        stFooter: TcxStyle;
        stGroup: TcxStyle;
        stGroupByBox: TcxStyle;
        stHeader: TcxStyle;
        stInactive: TcxStyle;
        stIncSearch: TcxStyle;
        stIndicator: TcxStyle;
        stPreview: TcxStyle;
        stSelection: TcxStyle;
        stHotTrack: TcxStyle;
        qizzStyle: TcxGridTableViewStyleSheet;
    GroupGrid: TcxGrid;
        GroupView: TcxGridDBTableView;
    GroupGridLevel1: TcxGridLevel;
        Panel1: TPanel;
        cxGrid2: TcxGrid;
        cxGridDBTableView1: TcxGridDBTableView;
        cxGridLevel1: TcxGridLevel;
        DB: TpFIBDatabase;
        DefaultTransaction: TpFIBTransaction;
        ReadTransaction: TpFIBTransaction;
        SmetaGroupSelect: TpFIBDataSet;
    SmetaGroupSelectGROUP_KOD: TFIBIntegerField;
    SmetaGroupSelectGROUP_TITLE: TFIBStringField;
    GroupSource: TDataSource;
    GroupViewGROUP_KOD: TcxGridDBColumn;
    GroupViewGROUP_TITLE: TcxGridDBColumn;
    Label1: TLabel;
    SmetDS: TpFIBDataSet;
    Panel2: TPanel;
    OkButton: TBitBtn;
    CancelButton: TBitBtn;
    SmetaGroupSelectID_GROUP: TFIBBCDField;
    SmetaSource: TDataSource;
    SmetDSID_SMETA: TFIBBCDField;
    SmetDSSMETA_TITLE: TFIBStringField;
    cxGridDBTableView1ID_SMETA: TcxGridDBColumn;
    cxGridDBTableView1SMETA_TITLE: TcxGridDBColumn;
    GroupViewID_GROUP: TcxGridDBColumn;
    procedure OkButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure GroupViewDblClick(Sender: TObject);
    procedure GroupViewKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SmetaGroupSelectAfterScroll(DataSet: TDataSet);
    private
        sp: TSprav;
    public
        constructor Create(AOwner: TComponent; sp: TSprav); reintroduce;
    end;

var
    fmSmetaGroup: TfmSmetaGroup;

implementation

{$R *.dfm}

constructor TfmSmetaGroup.Create(AOwner: TComponent; sp: TSprav);
var
    hnd: Integer;
begin
    inherited Create(AOwner);
    Self.sp := sp;
    hnd := sp.Input['DBHandle'];
    DB.Handle := TISC_DB_Handle(hnd);
    SmetaGroupSelect.Close;
    SmetaGroupSelect.Open;
    SmetaGroupSelectAfterScroll(SmetDS);
end;

procedure TfmSmetaGroup.OkButtonClick(Sender: TObject);
var
    i: Integer;
begin
    for i:=0 to GroupView.Controller.SelectedRowCount-1 do
    with sp.Output do
    begin
        Append;
        FieldValues['Id_Group'] := GroupView.Controller.SelectedRows[i].Values[GroupViewID_GROUP.Index];
        FieldValues['Group_Kod'] := GroupView.Controller.SelectedRows[i].Values[GroupViewGROUP_KOD.Index];
        FieldValues['Group_Title'] := GroupView.Controller.SelectedRows[i].Values[GroupViewGROUP_TITLE.Index];
        Post;
    end;
    ModalResult := mrOk;
end;


procedure TfmSmetaGroup.FormActivate(Sender: TObject);
begin
    if GroupGrid.CanFocus then GroupGrid.SetFocus;
end;

procedure TfmSmetaGroup.GroupViewDblClick(Sender: TObject);
begin
    OkButtonClick(Self);
end;

procedure TfmSmetaGroup.GroupViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
    if Key = VK_RETURN then OkButtonClick(Self);
end;

procedure TfmSmetaGroup.SmetaGroupSelectAfterScroll(DataSet: TDataSet);
begin
    SmetDS.Close;
    SmetDS.ParamByName('Id_Group').AsVariant := SmetaGroupSelect['Id_Group'];
    SmetDS.ParamByName('Period_Beg').AsDate := sp.Input['Period_Beg'];
    SmetDS.ParamByName('Period_End').AsDate := sp.Input['Period_End'];
    SmetDS.Open;
end;

end.

