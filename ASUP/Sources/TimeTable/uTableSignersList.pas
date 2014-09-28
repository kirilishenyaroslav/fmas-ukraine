unit uTableSignersList;

interface

uses
    Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ExtCtrls, uTableSignersData, uTableStrings, uTableSigners,
    Buttons, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
    cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
    cxGridCustomView, cxGridCustomTableView, cxGridTableView,
    cxGridDBTableView, cxGrid, Grids, DBGrids, ActnList, uActionControl,
    Menus, StdCtrls;

type
    TfmTableSignersList = class(TForm)
        Panel1: TPanel;
        AddButton: TSpeedButton;
        RefreshButton: TSpeedButton;
        SignersGridDBTableView1: TcxGridDBTableView;
        SignersGridLevel1: TcxGridLevel;
        SignersGrid: TcxGrid;
        SignersGridTableView1: TcxGridTableView;
        SignersTableView: TcxGridDBTableView;
        ID_TABLE_SIGNER: TcxGridDBColumn;
        FIO: TcxGridDBColumn;
        NAME_POST: TcxGridDBColumn;
        KIND: TcxGridDBColumn;
        ID: TcxGridDBColumn;
        NAME_OBJECT: TcxGridDBColumn;
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
        ModifyButton: TSpeedButton;
        InfoButton: TSpeedButton;
        ExitButton: TSpeedButton;
        DeleteButton: TSpeedButton;
        TableSignersActions: TActionList;
        AddTableSigner: TAction;
        RefreshTableSigner: TAction;
        ModifyTableSigner: TAction;
        InfoTableSigner: TAction;
        DeleteTableSigner: TAction;
        ActionControl: TqFActionControl;
        PopupMenu1: TPopupMenu;
        N1: TMenuItem;
        N2: TMenuItem;
        N3: TMenuItem;
        N4: TMenuItem;
        N5: TMenuItem;
        N6: TMenuItem;
        CloseAction: TAction;
        N7: TMenuItem;
        Panel2: TPanel;
        SpeedButton1: TSpeedButton;
        SpeedButton3: TSpeedButton;
        SpeedButton4: TSpeedButton;
        SpeedButton6: TSpeedButton;
        RealSignersGridDBTableView1: TcxGridDBTableView;
        RealSignersGridLevel1: TcxGridLevel;
        RealSignersGrid: TcxGrid;
        RealSignersGridDBTableView1ID_TABLE_SIGNER_REAL: TcxGridDBColumn;
        RealSignersGridDBTableView1ID_PCARD: TcxGridDBColumn;
        RealSignersGridDBTableView1DATE_BEG: TcxGridDBColumn;
        RealSignersGridDBTableView1DATE_END: TcxGridDBColumn;
        RealSignersGridDBTableView1FIO: TcxGridDBColumn;
        Panel3: TPanel;
        Label1: TLabel;
        AddRealSigner: TAction;
        ModifyRealSigner: TAction;
        InfoRealSigner: TAction;
        DeleteRealSigner: TAction;
        RealSignersActControl: TqFActionControl;
        procedure FormClose(Sender: TObject; var Action: TCloseAction);
        procedure FormCreate(Sender: TObject);
        procedure FormDestroy(Sender: TObject);
        procedure ExitButtonClick(Sender: TObject);
        procedure CloseActionExecute(Sender: TObject);
    private
        Sprav: TTableSigners;
    public
        constructor Create(AOwner: TComponent; Sprav: TTableSigners); reintroduce;
    end;

var
    fmTableSignersList: TfmTableSignersList;

implementation

{$R *.dfm}

constructor TfmTableSignersList.Create(AOwner: TComponent; Sprav: TTableSigners);
begin
    inherited Create(AOwner);
    Self.Sprav := Sprav;
end;

procedure TfmTableSignersList.FormClose(Sender: TObject;
    var Action: TCloseAction);
begin
    if FormStyle = fsMDIChild then Action := caFree;
end;

procedure TfmTableSignersList.FormCreate(Sender: TObject);
begin
    Caption := tbl_TableSignersCaption;
    Hint := tbl_TableSignersCaption;
    FIO.Caption := tbl_TableSignerFIOCaption;
    Name_Post.Caption := tbl_TableSignerNamePostCaption;
    Name_Object.Caption := tbl_TableSignerNameObjectCaption;
end;

procedure TfmTableSignersList.FormDestroy(Sender: TObject);
begin
    if FormStyle = fsMDIChild then Sprav.Free;
end;

procedure TfmTableSignersList.ExitButtonClick(Sender: TObject);
begin
    Close;
end;

procedure TfmTableSignersList.CloseActionExecute(Sender: TObject);
begin
    Close;
end;

end.
