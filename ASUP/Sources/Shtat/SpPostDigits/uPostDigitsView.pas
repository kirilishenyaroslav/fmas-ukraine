unit uPostDigitsView;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, ActnList, uActionControl,
    cxGridTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
    cxGridCustomTableView, cxGridDBTableView, cxGrid, Buttons, ExtCtrls,
    uPostDigitsDataModule;

type
    TfmPostDigitsView = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        ModifyButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        CancelButton: TSpeedButton;
        DigitsGrid: TcxGrid;
        DigitsView: TcxGridDBTableView;
        DigitsGridLevel1: TcxGridLevel;
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
        ActionControl: TqFActionControl;
        ActionList1: TActionList;
        AddAction: TAction;
        ModifyAction: TAction;
        DeleteAction: TAction;
        RefreshAction: TAction;
        DigitsViewID_POST_DIGIT: TcxGridDBColumn;
        DigitsViewNUM_DIGIT: TcxGridDBColumn;
        DigitsViewDATE_BEG: TcxGridDBColumn;
        DigitsViewDATE_END: TcxGridDBColumn;
        DigitsViewSUMMA: TcxGridDBColumn;
        DigitsViewKOEFF_STR: TcxGridDBColumn;
        procedure CancelButtonClick(Sender: TObject);
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure ActionControlAfterPrepare(Sender: TObject; Form: TForm);
        procedure ActionControlAfterRefresh(Sender: TObject; Value: Variant);
    private
        DM: TdmPostDigits;
    public
        constructor Create(AOwner: TComponent; DM: TdmPostDigits); reintroduce;
    end;

var
    fmPostDigitsView: TfmPostDigitsView;

implementation

{$R *.dfm}

uses uAddPostDigit;

constructor TfmPostDigitsView.Create(AOwner: TComponent; DM: TdmPostDigits);
begin
    inherited Create(AOwner);

    Self.DM := DM;
    DigitsView.DataController.DataSource := DM.PostDigitsSource;

    DigitsView.DataController.DataSet.Open;

    ActionControl.Database := DM.Database;
    ActionControl.SelectDataSet := DigitsView.DataController.DataSet;
    DigitsView.ViewData.Expand(False);
end;

procedure TfmPostDigitsView.CancelButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmPostDigitsView.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmPostDigitsView.ActionControlAfterPrepare(Sender: TObject;
    Form: TForm);
begin
    if Form is TfmAddPostDigit then
    begin
        (Form as TfmAddPostDigit).DM := DM;
    end;
end;

procedure TfmPostDigitsView.ActionControlAfterRefresh(Sender: TObject;
    Value: Variant);
begin
    DigitsView.ViewData.Expand(False);
    {ходим туды-сюды, чтобы на экране отобразилась нужная запись, а не начало грида}
    if not DigitsView.DataController.DataSet.Eof then
    begin
        DigitsView.DataController.DataSet.Next;
        DigitsView.DataController.DataSet.Prior;
    end;
end;

end.

