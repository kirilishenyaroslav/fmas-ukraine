unit uWorkHalfTime;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, StdCtrls, Buttons, ExtCtrls, cxStyles, cxCustomData, cxGraphics,
    cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView,
    ActnList, uActionControl, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridDBTableView, cxGrid;

type
    TfmWorkHalfTime = class(TForm)
        TopPanel: TPanel;
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        SpeedButton1: TSpeedButton;
        HalfTimeGrid: TcxGrid;
        WorkHalfTime: TcxGridDBTableView;
        HalfTimeGridLevel1: TcxGridLevel;
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
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
        procedure SpeedButton1Click(Sender: TObject);
        procedure ActionControlShowForm(Sender: TObject; Form: TForm);
    private
        Id_Man_Moving: Integer;
        FIO: string;
    public
        constructor Create(AOwner: TComponent; Id_Man_Moving: Integer;
            FIO: string); reintroduce;
    end;

var
    fmWorkHalfTime: TfmWorkHalfTime;

implementation

{$R *.dfm}

uses uAddHalfTime, PersonalCommon;

constructor TfmWorkHalfTime.Create(AOwner: TComponent; Id_Man_Moving: Integer; FIO: string);
begin
    inherited Create(AOwner);

    Self.Id_Man_Moving := Id_Man_Moving;
    Self.FIO := FIO;

    TopPanel.Caption := '    ' + FIO;

    TableData.HalfTimeDataSet.Close;
    TableData.HalfTimeDataSet.ParamByName('Id_Man_Moving').AsInteger := Id_Man_Moving;
    TableData.HalfTimeDataSet.Open;

    WorkHalfTime.DataController.DataSource := TableData.HalfTimeSource;
    WorkHalfTime.DataController.CreateAllItems;

    ActionControl.Database := TableData.DB;
    ActionControl.SelectDataSet := TableData.HalfTimeDataSet;
end;

procedure TfmWorkHalfTime.SpeedButton1Click(Sender: TObject);
begin
    Close;
end;

procedure TfmWorkHalfTime.ActionControlShowForm(Sender: TObject;
    Form: TForm);
begin
    if Form is TfmAddHalfTime then
        (Form as TfmAddHalfTime).Id_Man_Moving.Value := Id_Man_Moving;
end;

end.
