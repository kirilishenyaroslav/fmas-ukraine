unit uShtatBonusFrame;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter,
    cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
    cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, uShtatData,
    uActionControl, ActnList;

type
    TfrmShtatBonus = class(TFrame)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        ShtatBonusView: TcxGridDBTableView;
        BonusGridLevel1: TcxGridLevel;
        BonusGrid: TcxGrid;
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
        CancelButton: TSpeedButton;
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        ShtatBonusViewRAISE_NAME: TcxGridDBColumn;
        ShtatBonusViewPERCENT: TcxGridDBColumn;
        ShtatBonusViewSUMMA: TcxGridDBColumn;
        ShtatBonusViewSMETA_KOD: TcxGridDBColumn;
        ShtatBonusViewPPS_SMETA_KOD: TcxGridDBColumn;
        ShtatBonusViewDATE_BEG: TcxGridDBColumn;
        ShtatBonusViewDATE_END: TcxGridDBColumn;
        ShtatBonusViewID_SHTAT_BONUS: TcxGridDBColumn;
        ShtatBonusViewID_RAISE: TcxGridDBColumn;
        ShtatBonusViewIS_PERCENT: TcxGridDBColumn;
        ShtatBonusViewKOD_SM: TcxGridDBColumn;
        ShtatBonusViewKOD_SM_PPS: TcxGridDBColumn;
        ShtatBonusViewSMETA_TITLE: TcxGridDBColumn;
        ShtatBonusViewPPS_SMETA_TITLE: TcxGridDBColumn;
        ShtatBonusViewBONUS_SUM: TcxGridDBColumn;
        ShtatBonusViewBONUS_PPS: TcxGridDBColumn;
        ShtatBonusViewBONUS_MAIN: TcxGridDBColumn;
        procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
        procedure ShtatBonusViewKeyDown(Sender: TObject; var Key: Word;
            Shift: TShiftState);
    private
        Id_ShtatRas_Smet: Integer;
        DM: TdmShtatView;
    public
        procedure Prepare(DM: TdmShtatView; Id_ShtatRas_Smet: Integer);
    end;

implementation

{$R *.dfm}

uses uShtatBonusAdd, uShtatConsts;

procedure TfrmShtatBonus.Prepare(DM: TdmShtatView; Id_ShtatRas_Smet: Integer);
begin
    Self.DM := DM;
    Self.Id_ShtatRas_Smet := Id_ShtatRas_Smet;

    DM.BonusSelect.Close;
    DM.BonusSelect.ParamByName('Id_ShtatRas_Smet').AsInteger := Id_ShtatRas_Smet;
    DM.BonusSelect.ParamByName('Actual_Date').AsDate := ActualDate;
    DM.BonusSelect.Open;
    DM.BonusSelect.First;

    ShtatBonusView.DataController.DataSource := DM.BonusSource;
    //ShtatBonusView.DataController.CreateAllItems;

    ActionControl.SelectDataSet := DM.BonusSelect;
    ActionControl.Database := DM.DB;
    ActionControl.AddKeys := IntToStr(Id_ShtatRas_Smet);
end;


procedure TfrmShtatBonus.ActionControlBeforePrepare(Sender: TObject;
    Form: TForm);
begin
    if Form is TfmShtatBonusAdd then
    begin
        (Form as TfmShtatBonusAdd).DM := DM;
        (Form as TfmShtatBonusAdd).Id_ShtatRas_Smet := Id_ShtatRas_Smet;
    end;
end;

procedure TfrmShtatBonus.ShtatBonusViewKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
begin
    if (ord(Key) = ord('Z')) and (ssAlt in Shift) and (ssShift in Shift)
        and (ssCtrl in Shift) then
    try
        ShowMessage('Id_Shtat_Bonus: ' +
            IntToStr(DM.BonusSelect['Id_Shtat_Bonus']));
    except
    end;
end;

end.
