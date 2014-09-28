//******************************************************************************
// Проект "Контракты"
// Справочник категорий обучения
// Чернявский А.Э. 2005г.
//******************************************************************************

unit vc_SpBonus;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, dxBar, dxBarExtItems, ImgList, cxGraphics, cxContainer, cxEdit,
  cxProgressBar, dxStatusBar, cxControls, IBase,
  DM, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, DB,
  cxDBData, cxGridLevel, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxClasses, cxTextEdit,
  uCommonSp
  ;

type
  TfrmBonus = class(TForm)
    BarManager: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    PopupImageList: TImageList;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
    Styles: TcxStyleRepository;
    BackGround: TcxStyle;
    FocusedRecord: TcxStyle;
    Header: TcxStyle;
    DesabledRecord: TcxStyle;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    cxStyle5: TcxStyle;
    cxStyle6: TcxStyle;
    cxStyle7: TcxStyle;
    cxStyle8: TcxStyle;
    cxStyle9: TcxStyle;
    cxStyle10: TcxStyle;
    cxStyle11: TcxStyle;
    cxStyle12: TcxStyle;
    cxStyle13: TcxStyle;
    cxStyle14: TcxStyle;
    cxStyle15: TcxStyle;
    cxStyle16: TcxStyle;
    Default_StyleSheet: TcxGridTableViewStyleSheet;
    DevExpress_Style: TcxGridTableViewStyleSheet;
    Grid: TcxGrid;
    GridDBView: TcxGridDBTableView;
    GridLevel: TcxGridLevel;
    name: TcxGridDBColumn;
    full_name: TcxGridDBColumn;
    SelectButton: TdxBarLargeButton;
    procedure ExitButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DeleteButtonClick(Sender: TObject);
    procedure AddButtonClick(Sender: TObject);
  private
    DM:TDM_IE;
  public
    res:Variant;
    constructor  Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);reintroduce;
  end;


implementation

{$R *.dfm}

constructor TfrmBonus.Create(AOwner:TComponent;DB_Handle:TISC_DB_HANDLE);
begin
Screen.Cursor:=crHourGlass;
inherited Create(AOwner);
DM:=TDM_IE.Create(Self);
DM.DataSet.SQLs.SelectSQL.Text := 'select * from VC_INI_BONUS_SELECT order by full_name';
DM.DB.Handle:=DB_Handle;
DM.DataSet.Open;
GridDBView.DataController.DataSource := DM.DataSource;
Screen.Cursor:=crDefault;
end;


procedure TfrmBonus.ExitButtonClick(Sender: TObject);
begin
close;
end;

procedure TfrmBonus.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 DM.Free;
end;

procedure TfrmBonus.DeleteButtonClick(Sender: TObject);
begin
if Dm.DataSet.RecordCount = 0 then exit;
            with DM.StProc do
             try
              Transaction.StartTransaction;
              StoredProcName := 'VC_INI_BONUS_DELETE';
              Prepare;
              ParamByName('ID_RAISE').AsInt64       := Dm.DataSet['ID_RAISE'] ;
              ExecProc;
              Transaction.Commit;
             except
                ShowMessage('Error in VC_INI_BONUS_DELETE');
                Transaction.Rollback;
                raise;
               end;
         DM.DataSet.CloseOpen(True);
         GridDBView.DataController.FocusedRecordIndex := GridDBView.DataController.RecordCount-1;
end;

procedure TfrmBonus.AddButtonClick(Sender: TObject);
var
    sp: TSprav;
begin
        // создать справочник
    sp := GetSprav('ASUP\SpRaise');
    if sp <> nil then
    begin
            // заполнить входные параметры
        with sp.Input do
        begin
            Append;
            FieldValues['DBHandle'] := Integer(DM.DB.Handle);
                // модальный показ
            FieldValues['ShowStyle'] := 0;
                // единичная выборка
            FieldValues['Select'] := 1;

            FieldValues['Raise_Select_Kind'] := 1;
            FieldValues['Actual_Date'] := Date;
            Post;
        end;

        sp.Show;
        if (sp.Output <> nil) and not sp.Output.IsEmpty then
        begin
           with DM.StProc do
             try
              Transaction.StartTransaction;
              StoredProcName := 'VC_INI_BONUS_INSERT';
              Prepare;
              ParamByName('ID_RAISE').AsInt64       := sp.Output['Id_Raise'];
              ExecProc;
              Transaction.Commit;
             except
                ShowMessage('Error in VC_INI_BONUS_INSERT');
                Transaction.Rollback;
                raise;
               end;
         DM.DataSet.CloseOpen(True);
        end;
        sp.Free;
    end;
end;



end.
