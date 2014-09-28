unit uShtatPeople;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, ExtCtrls, Buttons, uShtatData, cxStyles, cxCustomData,
    cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData,
    cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, Mask, DBCtrls, ClipBrd;

type
    TfmShtatPeople = class(TForm)
        Panel1: TPanel;
        PeopleGrid: TcxGrid;
        PeopleView: TcxGridDBTableView;
        PeopleGridLevel1: TcxGridLevel;
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
        PeopleViewNAME_POST: TcxGridDBColumn;
        PeopleViewOKLAD: TcxGridDBColumn;
        PeopleViewDATE_BEG: TcxGridDBColumn;
        PeopleViewREAL_DATE_END: TcxGridDBColumn;
        PeopleViewKOD_SM: TcxGridDBColumn;
        PeopleViewKOD_SM_PPS: TcxGridDBColumn;
        PeopleViewFIO_TN: TcxGridDBColumn;
        PeopleViewDBSmets: TcxGridDBColumn;
        Label1: TLabel;
        Smeta_Title: TDBEdit;
        Label2: TLabel;
        Label3: TLabel;
        SMETA_PPS_TITLE: TDBEdit;
        PeopleViewDBKolStavok: TcxGridDBColumn;
        PeopleViewStatus: TcxGridDBColumn;
        Panel2: TPanel;
        ActualBox: TCheckBox;
        PeopleViewNUM_ORDER: TcxGridDBColumn;
        PeopleViewDATE_ORDER: TcxGridDBColumn;
        PeopleViewNUM_ORDER_KADR: TcxGridDBColumn;
        PeopleViewDATE_ORDER_KADR: TcxGridDBColumn;
        PeopleViewID_ORDER: TcxGridDBColumn;
        PeopleViewTEMPFOR: TcxGridDBColumn;
        PeopleViewTEMPFREE: TcxGridDBColumn;
        PeopleViewNAME_SOVMEST: TcxGridDBColumn;
        Label4: TLabel;
        DBEdit1: TDBEdit;
        PeopleViewFACT_STAVOK: TcxGridDBColumn;
        PeopleViewTEMPFREE_STAVOK: TcxGridDBColumn;
        PeopleViewTEMPFOR_STAVOK: TcxGridDBColumn;
        CancelButton: TBitBtn;
        BitBtn1: TBitBtn;
        Label5: TLabel;
        StatusPanel: TPanel;
        TempFor: TcxStyle;
        TempFree: TcxStyle;
        VacantPanel: TPanel;
        TestLabel: TLabel;
        procedure CancelButtonClick(Sender: TObject);
        procedure PeopleViewCustomDrawCell(Sender: TcxCustomGridTableView;
            ACanvas: TcxCanvas; AViewInfo: TcxGridTableDataCellViewInfo;
            var ADone: Boolean);
        procedure ActualBoxClick(Sender: TObject);
        procedure PeopleViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        DM: TdmShtatView;
        Kol_Stavok: Variant;

        procedure Expand;
    public
        constructor Create(AOwner: TComponent; DM: TdmShtatView;
            Id_Department, Id_Smeta, Id_Post_Salary: Variant;
            Act_Date: TDate; Kol_Stavok, Vacantions: Variant;
            Id_Smeta_Pps, Koeff, Id_Type_Post, Id_Level, Id_Sr: Variant); reintroduce;
    end;

implementation

{$R *.dfm}

uses qFTools;

constructor TfmShtatPeople.Create(AOwner: TComponent; DM: TdmShtatView;
    Id_Department, Id_Smeta, Id_Post_Salary: Variant; Act_Date: TDate;
    Kol_Stavok, Vacantions: Variant; Id_Smeta_Pps, Koeff, Id_Type_Post,
    Id_Level, Id_Sr: Variant);
begin
    inherited Create(AOwner);
    Self.DM := DM;

    PeopleView.DataController.DataSource := DM.PeopleSource;
    Smeta_Title.DataSource := DM.PeopleSource;
    Smeta_Pps_Title.DataSource := DM.PeopleSource;

    Self.Kol_Stavok := Kol_Stavok;
    StatusPanel.Caption := StatusPanel.Caption + '       штат: ' + Kol_Stavok;

    if Trim(Coalesce(Vacantions, '')) <> '' then
        VacantPanel.Caption := 'вакансій: ' + Coalesce(Vacantions, '');

    {      ShowMessage(' Id_Department:' +
          IntToStr(Coalesce(Id_Department,-1)) +
          #13#10' Base_Smeta:' +
          IntToStr(Coalesce(Id_Smeta,0)) +
          #13#10' Id_Post_Salary:' +
          IntToStr(Coalesce(Id_Post_Salary,-1)) +
          #13#10' Id_Smeta_Pps:' +
          IntToStr(Coalesce(Id_Smeta_Pps, 0)) +
          #13#10' Koeff_Pps:' +
                FormatFloat('######.###',Coalesce(Koeff, 0))+
          #1310' Act_Date: ' +
          DateToStr(Act_Date));}

    DM.ShtatPeople.Close;
    if DM.NewVersion then
    begin
        DM.ShtatPeople.SelectSQL.Text := 'SELECT * FROM UP_SHTAT_PEOPLE(' +
            ':Id_Department, :Id_Smeta, :Id_Post_Salary, :Id_Smeta_Pps,' +
            ':Koeff, :Id_Type_Post, :Act_Date, :Id_Level, :Id_Sr)'
    end
    else
    begin
        DM.ShtatPeople.SelectSQL.Text := 'SELECT * FROM ASUP_SHTAT_PEOPLE(' +
            ':Id_Department, :Id_Smeta, :Id_Post_Salary, :Id_Smeta_Pps,' +
            ':Koeff, :Id_Type_Post, :Act_Date)'
    end;

    DM.ShtatPeople.ParamByName('Id_Department').AsVariant := Id_Department;
    DM.ShtatPeople.ParamByName('Id_Smeta').AsVariant := Id_Smeta;
    DM.ShtatPeople.ParamByName('Id_Post_Salary').AsVariant := Id_Post_Salary;
    DM.ShtatPeople.ParamByName('Act_Date').AsDate := Act_Date;
    DM.ShtatPeople.ParamByName('Id_Smeta_Pps').AsVariant := Id_Smeta_Pps;
    DM.ShtatPeople.ParamByName('Koeff').AsVariant := Koeff;
    DM.ShtatPeople.ParamByName('Id_Type_Post').AsVariant := Id_Type_Post;
    if DM.NewVersion then
    begin
        DM.ShtatPeople.ParamByName('Id_Level').AsVariant := Id_Level;
        DM.ShtatPeople.ParamByName('Id_Sr').AsVariant := Id_Sr;
    end;
    if DM.ShtatPeople.Transaction.Active then
        DM.ShtatPeople.Transaction.Rollback;
    DM.ShtatPeople.Transaction.StartTransaction;
    DM.ShtatPeople.Prepare;

    // делаем два раза заполнение параметров, т.к. иначе странные глюки
    DM.ShtatPeople.Close;
    DM.ShtatPeople.ParamByName('Id_Department').AsVariant := Id_Department;
    DM.ShtatPeople.ParamByName('Id_Smeta').AsVariant := Id_Smeta;
    DM.ShtatPeople.ParamByName('Id_Post_Salary').AsVariant := Id_Post_Salary;
    DM.ShtatPeople.ParamByName('Act_Date').AsDate := Act_Date;
    DM.ShtatPeople.ParamByName('Id_Smeta_Pps').AsVariant := Id_Smeta_Pps;
    DM.ShtatPeople.ParamByName('Koeff').AsVariant := Koeff;
    DM.ShtatPeople.ParamByName('Id_Type_Post').AsVariant := Id_Type_Post;
    if DM.NewVersion then
    begin
        DM.ShtatPeople.ParamByName('Id_Level').AsVariant := Id_Level;
        DM.ShtatPeople.ParamByName('Id_Sr').AsVariant := Id_Sr;
    end;
    if DM.ShtatPeople.Transaction.Active then
        DM.ShtatPeople.Transaction.Rollback;
    DM.ShtatPeople.Transaction.StartTransaction;
    DM.ShtatPeople.Prepare;

    DM.ShtatPeople.Open;

    if DM.NewVersion then TestLabel.Caption := 'УП2';

    ActualBox.Checked := True;
    ActualBoxClick(ActualBox);

    //    Expand;
end;

procedure TfmShtatPeople.Expand;
var
    i: Integer;
begin
    i := 0;
    while true do
    begin
        if i >= PeopleView.ViewData.RowCount then
            break;
        PeopleView.ViewData.Rows[i].Expand(True);
        inc(i);
    end;
end;

procedure TfmShtatPeople.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmShtatPeople.PeopleViewCustomDrawCell(
    Sender: TcxCustomGridTableView; ACanvas: TcxCanvas;
    AViewInfo: TcxGridTableDataCellViewInfo; var ADone: Boolean);
var
    TempFree: Variant;
    TempFor: Variant;
begin
    TempFree := AViewInfo.GridRecord.Values[PeopleViewTEMPFREE_Stavok.Index];
    TempFor := AViewInfo.GridRecord.Values[PeopleViewTEMPFOR_Stavok.Index];

    if AViewInfo.GridRecord.Values[PeopleViewStatus.Index] = 1 then
        ACanvas.Brush.Color := clSilver
    else
        if not VarIsNull(TempFor) and (TempFor > 0.0001) then
            ACanvas.Brush.Color := clLime
        else
            if not VarIsNull(TempFree) and (TempFree > 0.0001) then
                ACanvas.Brush.Color := clYellow
            else
                ACanvas.Brush.Color := clInfoBk
end;

procedure TfmShtatPeople.ActualBoxClick(Sender: TObject);
begin
    if ActualBox.Checked then
    begin
        PeopleView.DataController.DataSet.Filtered := False;
        PeopleView.DataController.DataSet.Filter := 'Status = 0';
        PeopleView.DataController.DataSet.Filtered := True;
        Expand;
    end
    else
    begin
        PeopleView.DataController.DataSet.Filtered := False;
        Expand;
    end;
end;

procedure ShowInfo(DataSet: TDataSet);
var text: string;
    i: integer;
begin
    text := '';
    for i := 1 to DataSet.Fields.Count do
        text := text + DataSet.Fields[i - 1].FieldName + ' : ' + DataSet.Fields[i - 1].DisplayText + #13;
    ShowMessage(text);
end;


procedure TfmShtatPeople.PeopleViewKeyDown(Sender: TObject; var Key: Word;
    Shift: TShiftState);
begin
    if ((Key = VK_F12) and (ssShift in Shift)) then
    begin
        ShowInfo(PeopleView.DataController.DataSource.DataSet);
        if not VarIsNull(PeopleView.DataController.DataSource.DataSet['id_man_moving']) then
            ClipBoard.AsText := PeopleView.DataController.DataSource.DataSet['id_man_moving'];
    end;
end;

end.
