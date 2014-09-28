unit CheckListVoplPropGroup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxLookAndFeelPainters, StdCtrls, cxButtons, ExtCtrls,
  cxControls, cxContainer, cxCheckListBox, cxCheckBox, Unit_Sp_VidOpl_Consts,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxGridCustomTableView, cxGridTableView, cxClasses,
  cxGridCustomView, cxGridLevel, cxGrid, cxTextEdit, DB, RxMemDS, cxDBData,
  cxGridDBTableView, ActnList;

type
  TFCheckList = class(TForm)
    Panel1: TPanel;
    CheckAllBtn: TcxButton;
    UnCheckAllBtn: TcxButton;
    Panel2: TPanel;
    YesBtn: TcxButton;
    CancelBtn: TcxButton;
    GridLevel1: TcxGridLevel;
    Grid: TcxGrid;
    Style: TcxStyleRepository;
    GridTableViewStyleSheetDevExpress: TcxGridTableViewStyleSheet;
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
    MemoryData: TRxMemoryData;
    DSource: TDataSource;
    GridDBTableView1: TcxGridDBTableView;
    GridColumnIDescription: TcxGridDBColumn;
    GridColumnInUse: TcxGridDBColumn;
    ActionList1: TActionList;
    Action1: TAction;
    procedure CheckAllBtnClick(Sender: TObject);
    procedure UnCheckAllBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GridDBTableView1DblClick(Sender: TObject);
    procedure GridDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}


procedure TFCheckList.CheckAllBtnClick(Sender: TObject);
var _RecNo:Word;
begin
_RecNo:=MemoryData.RecNo;
MemoryData.First;
while not MemoryData.Eof do
 begin
  MemoryData.Edit;
  MemoryData.FieldValues['INUSE']:='T';
  MemoryData.Post;
  MemoryData.Next;
 end;
MemoryData.RecNo:=_RecNo;
end;

procedure TFCheckList.UnCheckAllBtnClick(Sender: TObject);
var _RecNo:Word;
begin
_RecNo:=MemoryData.RecNo;
MemoryData.First;
while not MemoryData.Eof do
 begin
  MemoryData.Edit;
  MemoryData.FieldValues['INUSE']:='F';
  MemoryData.Post;
  MemoryData.Next;
 end;
MemoryData.RecNo:=_RecNo;
end;

procedure TFCheckList.CancelBtnClick(Sender: TObject);
begin
ModalResult:=mrCancel;
end;

procedure TFCheckList.FormCreate(Sender: TObject);
begin
self.CheckAllBtn.Caption   := FSpVoplIniPropGroupControl_CheckAllBtn_Caption;
self.UnCheckAllBtn.Caption := FSpVoplIniPropGroupControl_UnCheckAllBtn_Caption;
self.YesBtn.Caption        := YesBtn_Caption;
self.CancelBtn.Caption     := CancelBtn_Caption;
end;

procedure TFCheckList.GridDBTableView1DblClick(Sender: TObject);
begin
MemoryData.Edit;
if MemoryData.FieldValues['INUSE']='T' then
   MemoryData.FieldValues['INUSE']:='F'
else MemoryData.FieldValues['INUSE']:='T';
MemoryData.Post;
end;

procedure TFCheckList.GridDBTableView1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_SPACE then GridDBTableView1DblClick(Sender);
end;

procedure TFCheckList.Action1Execute(Sender: TObject);
begin
ModalResult:=mrYes;
end;

end.
