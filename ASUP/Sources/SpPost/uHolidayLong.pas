unit uHolidayLong;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, Buttons, ExtCtrls, cxGridLevel,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxClasses, uActionControl, ActnList,
  U_SPPost_DataModule;

type
  TSpHolidayLong = class(TForm)
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
    cxGrid1: TcxGrid;
    HolidayLongView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    ActionControl: TqFActionControl;
    ActionList1: TActionList;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    QuitAction: TAction;
    SelectAction: TAction;
    HolidayLongViewID_POST_HOLIDAY: TcxGridDBColumn;
    HolidayLongViewHOLIDAY_LONG: TcxGridDBColumn;
    HolidayLongViewID_HOLIDAY: TcxGridDBColumn;
    HolidayLongViewHOLIDAY_TYPE_FULL_NAME: TcxGridDBColumn;
    procedure QuitActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure ActionControlBeforePrepare(Sender: TObject; Form: TForm);
    procedure ActionControlShowForm(Sender: TObject; Form: TForm);
    procedure HolidayLongViewDblClick(Sender: TObject);
    procedure HolidayLongViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    DM: TDMSPPost;
  end;

var
  SpHolidayLong: TSpHolidayLong;

implementation

{$R *.dfm}

uses uAddHolidayLong;

procedure TSpHolidayLong.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TSpHolidayLong.SelectActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TSpHolidayLong.ActionControlBeforePrepare(Sender: TObject;
  Form: TForm);
begin
    (Form as TfmAddHolidayLong).DM := DM;
end;

procedure TSpHolidayLong.ActionControlShowForm(Sender: TObject;
  Form: TForm);
begin
    (Form as TfmAddHolidayLong).DM := DM;
end;

procedure TSpHolidayLong.HolidayLongViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

procedure TSpHolidayLong.HolidayLongViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
    if Key = VK_RETURN then SelectAction.Execute;
end;

end.
