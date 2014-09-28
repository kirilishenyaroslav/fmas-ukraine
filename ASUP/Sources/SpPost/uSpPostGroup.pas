unit uSpPostGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Buttons, ExtCtrls, cxClasses, ActnList,
  uActionControl;

type
  TfmSpPostGroup = class(TForm)
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
    Panel1: TPanel;
    AddButton: TSpeedButton;
    ModifyButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    RefreshButton: TSpeedButton;
    CancelButton: TSpeedButton;
    SelectButton: TSpeedButton;
    cxGrid1: TcxGrid;
    PostGroupView: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    ActionList1: TActionList;
    AddAction: TAction;
    ModifyAction: TAction;
    DeleteAction: TAction;
    RefreshAction: TAction;
    QuitAction: TAction;
    SelectAction: TAction;
    ActionControl: TqFActionControl;
    procedure QuitActionExecute(Sender: TObject);
    procedure SelectActionExecute(Sender: TObject);
    procedure PostGroupViewDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmSpPostGroup: TfmSpPostGroup;

implementation

{$R *.dfm}

procedure TfmSpPostGroup.QuitActionExecute(Sender: TObject);
begin
    Close;
end;

procedure TfmSpPostGroup.SelectActionExecute(Sender: TObject);
begin
    ModalResult := mrOk;
end;

procedure TfmSpPostGroup.PostGroupViewDblClick(Sender: TObject);
begin
    SelectAction.Execute;
end;

end.
