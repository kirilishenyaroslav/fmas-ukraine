unit SpPost_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCalendar, cxTextEdit,
  cxLookAndFeelPainters, ActnList, StdCtrls, cxButtons, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxControls,
  cxGridCustomView, cxGrid, cxGridBandedTableView, cxClasses, ExtCtrls,iBase,
  SpPost_DM,TuCommonProc,TuCommonStyles;

type
  TFormPost = class(TForm)
    Panel1: TPanel;
    Grid: TcxGrid;
    GridDBTableView1: TcxGridDBTableView;
    GridText1: TcxGridDBColumn;
    GridText2: TcxGridDBColumn;
    GridLevel1: TcxGridLevel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    FIO:string;
    Post:string;
    pStylesDM:TStyleDM;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);reintroduce;

  end;

var
  FormPost: TFormPost;

implementation

{$R *.dfm}
constructor TFormPost.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE);
 begin
  inherited Create(AOwner);
  DM:=TDM.Create(AOwner);
  DM.DB.Handle:=ADB_Handle;
  DM.DSet.SQLs.SelectSQL.Text:='select * from UP_GET_TEXT_SHABLON(6)';
  DM.DSet.Open;
  DM.DSource.DataSet:=DM.DSet;
  GridDBTableView1.DataController.DataSource:=DM.DSource;
  Caption:=GetConst('SpPost','Form') ;
  ButtonYes.Caption:=GetConst('Yes','Button');
  ButtonCancel.Caption:=GetConst('Cancel','Button');
  GridText1.Caption:=GetConst('FIO','GridColumn');
  GridText2.Caption:=GetConst('Post','GridColumn');
  pStylesDM:=TStyleDM.Create(Self);
  GridDBTableView1.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;

 end ;

procedure TFormPost.ActionYesExecute(Sender: TObject);
 begin
  FIO:=DM.DSet['TEXT1'];
  Post:=DM.DSet['TEXT2'];
  ModalResult:=mrYes;
 end;

procedure TFormPost.ActionCancelExecute(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

end.
