unit SpTuDep_Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, cxCalendar,
  ActnList, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid,
  StdCtrls, cxButtons, ExtCtrls,iBase, cxTL, cxMaskEdit, cxCheckBox,
  cxInplaceContainer, cxDBTL, cxTLData,TuCommonProc,TuCommonStyles;

type
  TFormDep_Main = class(TForm)
    Panel1: TPanel;
    ButtonYes: TcxButton;
    ButtonCancel: TcxButton;
    ActionList: TActionList;
    ActionYes: TAction;
    ActionCancel: TAction;
    TreeListDep: TcxDBTreeList;
    TreeListColumnName: TcxDBTreeListColumn;
    procedure ActionYesExecute(Sender: TObject);
    procedure ActionCancelExecute(Sender: TObject);
  private
    { Private declarations }
  public
    IdDepartment:String;
    pStylesDM:TStyleDM ;
    constructor Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer);
  end;

var
  FormDep_Main: TFormDep_Main;

implementation

uses SpTuDep_DM;

{$R *.dfm}

constructor TFormDep_Main.Create(AOwner:TComponent;ADB_Handle:TISC_DB_HANDLE;
                           Root:Integer;DateActual:TDate;
                           ShowDelete:Integer;IdProperty:Integer);
 begin
  inherited Create(AOwner);
  DM:=TDM.Create(AOwner);
  DM.DB.Handle:=ADB_Handle;
  DM.DSet.SQLs.SelectSQL.Text:='select * from TU_SP_DEPARTMENT_FILT_S('+
                          Inttostr(Root)+','''+Datetostr(DateActual)+
                          ''','+Inttostr(ShowDelete)+','+inttostr(IdProperty)+')';
  DM.DSet.Open;
  DM.DSource.DataSet:=DM.DSet;
  TreeListDep.DataController.DataSource:=DM.DSource;
  Caption:=GetConst('NotUseDep','Form') ;
  ButtonYes.Caption:=GetConst('Yes','Button');
  ButtonCancel.Caption:=GetConst('Cancel','Button');
  TreeListColumnName.Caption.Text  :=GetConst('NameDep','GridColumn') ;
  pStylesDM:=TStyleDM.Create(Self);
  TreeListDep.Styles.StyleSheet:=pStylesDM.GridTableViewStyleSheetDevExpress ;
 end ;

procedure TFormDep_Main.ActionYesExecute(Sender: TObject);
begin
IdDepartment:=inttostr(DM.DSet['ID_DEPARTMENT']);
ModalResult:=mrYes;
end;

procedure TFormDep_Main.ActionCancelExecute(Sender: TObject);
begin
  ModalResult:=mrCancel;
end;

end.
