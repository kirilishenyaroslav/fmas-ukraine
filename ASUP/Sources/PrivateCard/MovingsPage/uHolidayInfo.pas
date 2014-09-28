unit uHolidayInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, ExtCtrls, cxGridLevel, cxClasses,
  cxControls, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, uMovingsDataModule, cxContainer, cxLabel,
  cxDBLabel, StdCtrls, Buttons, cxTL, cxMaskEdit, cxInplaceContainer,
  cxDBTL, cxTLData, ActnList;

type
  THolidayForm = class(TForm)
    Panel1: TPanel;
    DataSource1: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxDBLabel1: TcxDBLabel;
    cxDBLabel2: TcxDBLabel;
    Label1: TLabel;
    Label2: TLabel;
    cxDBTL_Bonus: TcxDBTreeList;
    cxDBTLC_Name: TcxDBTreeListColumn;
    cxDBTLC_Beg: TcxDBTreeListColumn;
    cxDBTLC_End: TcxDBTreeListColumn;
    cxDBTLC_Bonus: TcxDBTreeListColumn;
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
    cxTreeListStyleSheet1: TcxTreeListStyleSheet;
    cxDBTLC_Summ: TcxDBTreeListColumn;
    ActionList1: TActionList;
    Edit_Action: TAction;
    CloseAct: TAction;
    procedure FormCreate(Sender: TObject);
    procedure cxGrid1DBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxDBTL_BonusCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure Edit_ActionExecute(Sender: TObject);
    procedure CloseActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    DMod: TdmMovings;
    constructor Create(AOwner: TComponent; DM: TdmMovings; id_man_moving: integer); reintroduce;
  end;

var
  HolidayForm: THolidayForm;

implementation

{$R *.dfm}

uses  Clipbrd, uBonusSmetEdit, uFormControl;

constructor THolidayForm.Create(AOwner: TComponent; DM: TdmMovings; id_man_moving: integer);
begin
  inherited Create(AOwner);
  DMod:=TdmMovings.Create(Self);
  DMod:=DM;
  DataSource1.DataSet:=DMod.BonusSelect;
  DMod.BonusSelect.Close;
  DMod.BonusSelect.ParamByName('id_man_moving').AsInteger:=id_man_moving;
  DMod.BonusSelect.Open;
end;

procedure THolidayForm.FormCreate(Sender: TObject);
begin
//  dm.HolidaySelect.Close;
//  dm.HolidaySelect.ParamByName('id_man_moving').AsInteger:=dmMovings.MovingsSelect['id_man_moving'];
//  dm.HolidaySelect.Open;
end;

procedure THolidayForm.cxGrid1DBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   begin
     ShowInfo(cxDBTL_Bonus.DataController.DataSource.DataSet);
     if not VarIsNull(cxDBTL_Bonus.DataController.DataSource.DataSet['id_man_bonus']) then
      ClipBoard.AsText:=cxDBTL_Bonus.DataController.DataSource.DataSet['id_man_bonus'];
   end
end;

procedure THolidayForm.cxDBTL_BonusCustomDrawCell(Sender: TObject;
  ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
  var ADone: Boolean);
begin
    if (not AViewInfo.Selected)and
       (not VarIsNull(AViewInfo.Node.Values[cxDBTLC_Beg.Position.ColIndex])) then
    if ( AViewInfo.Node.Values[cxDBTLC_Beg.Position.ColIndex] > ActualDate )
        or
       ( AViewInfo.Node.Values[cxDBTLC_End.Position.ColIndex] < ActualDate )
    then
    begin
        ACanvas.Brush.Color := clSilver;
    end;
end;

procedure THolidayForm.Edit_ActionExecute(Sender: TObject);
var
  RForm: TForm2;
begin
  if VarIsNull(cxDBTL_Bonus.DataController.DataSource.DataSet['id_man_bonus_smet'])
   then Exit;

  RForm:=TForm2.Create(self,DMod,fmModify,cxDBTL_Bonus.DataController.DataSource.DataSet['id_man_bonus_smet']);
  RForm.ShowModal;
  RForm.Free;
  DMod.BonusSelect.Close;
  DMod.BonusSelect.Open;
end;

procedure THolidayForm.CloseActExecute(Sender: TObject);
begin
  Close;
end;

end.
