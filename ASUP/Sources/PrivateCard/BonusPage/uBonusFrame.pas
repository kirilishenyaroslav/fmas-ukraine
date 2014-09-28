unit uBonusFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView, EditControl,
  cxGridDBTableView, cxGrid, uBonusDataModule, Buttons, ExtCtrls,
  ActnList, ComCtrls, FieldControl, SpComboBox, uCommonSp, SpCommon, Mask,
  CheckEditUnit, cxContainer, cxLabel, cxDBLabel, cxCheckBox, cxTL,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCalendar;

type
  TfmPCardBonusPage = class(TFrame)
    cxStyleRepository1: TcxStyleRepository;
    DS_Bonus: TDataSource;
    Panel1: TPanel;
    Label1: TLabel;
    Ord: TcxDBLabel;
    Label2: TLabel;
    Date_Ord: TcxDBLabel;
    cxCB_ShowOld: TcxCheckBox;
    cxDBTL_Bonus: TcxDBTreeList;
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
    cxDBTLC_Name: TcxDBTreeListColumn;
    cxDBTLC_Beg: TcxDBTreeListColumn;
    cxDBTLC_End: TcxDBTreeListColumn;
    cxDBTLC_Bonus: TcxDBTreeListColumn;
    procedure FrameExit(Sender: TObject);
    procedure BonusGridDBTableView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LoadFromRegistry;
    procedure SaveIntoRegistry;
    procedure cxCB_ShowOldClick(Sender: TObject);
    procedure cxDBTL_BonusCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
  private
    { Private declarations }
  public
    DM:TdmBonus;
    id_pcard:integer;
    ActualDate:TDate;
    constructor Create(AOwner: TComponent; DMod: TdmBonus; Id_PC: Integer; modify :integer; ActualDate: TDate); reintroduce;
  end;

implementation

uses FIBDatabase, Registry;

{$R *.dfm}

constructor TfmPCardBonusPage.Create(AOwner: TComponent; DMod: TdmBonus; Id_PC: Integer; modify :integer; ActualDate: TDate);
var c,i:integer;
begin
    inherited Create(AOwner);

    Self.ActualDate := ActualDate;


    DM:=Dmod; id_pcard:=Id_PC;

    DM.BonusSelect.Filter:=QuotedStr(DateToStr(ActualDate))+'<date_end';

    LoadFromRegistry;
    DM.BonusSelect.Filtered:=not cxCB_ShowOld.Checked;

    DS_Bonus.DataSet:=DM.BonusSelect;
    DM.BonusSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DM.BonusSelect.Open;

    c:=cxDBTL_Bonus.Nodes.Count-1;
    for i:=0 to c do
      if (VarIsNull(cxDBTL_Bonus.Nodes.Items[i].Values[cxDBTLC_Beg.Position.ColIndex]))
//         and
//         (( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex] <= ActualDate )
//          and
//          ( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_END.Position.ColIndex] >= ActualDate ))
       then cxDBTL_Bonus.Nodes.Items[i].Expand(False);
end;

procedure TfmPCardBonusPage.LoadFromRegistry;
var
	reg: TRegistry;
	key, ownerName: String;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if Owner <> nil then ownerName := Owner.Name
		else ownerName := '<unknown owner>';

		key := '\Software\ASUP\Klug Soft\'+
		ExtractFileName(Application.ExeName)+'\'+ownerName+'\'+Name;

		if reg.OpenKey(key,False) then
		begin
			cxCB_ShowOld.Checked := reg.ReadBool('show_old');
			reg.CloseKey;
		end;
	except ;
	end;
	reg.Free;
end;

procedure TfmPCardBonusPage.SaveIntoRegistry;
var
	reg: TRegistry;
	key, ownerName: String;
begin
	reg := TRegistry.Create;
	try
		reg.RootKey := HKEY_CURRENT_USER;

		if Owner <> nil then ownerName := Owner.Name
		else ownerName := '<unknown owner>';

		key := '\Software\ASUP\Klug Soft\'+
		ExtractFileName(Application.ExeName)+'\'+ownerName+'\'+Name;

		if reg.OpenKey(key,True) then
		begin
			reg.WriteBool('show_old',cxCB_ShowOld.Checked);
			reg.CloseKey;
		end;
	finally
		reg.Free;
	end;
end;

procedure TfmPCardBonusPage.FrameExit(Sender: TObject);
begin
  SaveIntoRegistry;
//  DM.ReadTransaction.Commit;
end;

procedure TfmPCardBonusPage.BonusGridDBTableView1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   ShowInfo(cxDBTL_Bonus.DataController.DataSource.DataSet);
end;

procedure TfmPCardBonusPage.cxCB_ShowOldClick(Sender: TObject);
begin
  DM.BonusSelect.Filtered:=not cxCB_ShowOld.Checked;
end;

procedure TfmPCardBonusPage.cxDBTL_BonusCustomDrawCell(Sender: TObject;
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

end.
