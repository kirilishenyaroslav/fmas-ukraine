unit uMovingsFrame;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridTableView, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridDBTableView, cxGrid, uMovingsDataModule, cxContainer, cxLabel,
  cxDBLabel, ExtCtrls, Buttons, cxCalendar, cxTL, //Clipbrd,
  cxInplaceContainer, cxTLData, cxDBTL, cxMaskEdit, cxCurrencyEdit,
  cxCheckBox, ActnList;

type
  TfmPCardMovingsPage = class(TFrame)
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
    Label3: TLabel;
    Num_Ord: TcxDBLabel;
    Label4: TLabel;
    Date_ord: TcxDBLabel;
    SB_Holiday: TSpeedButton;
    cxDBTL_MovingsTree: TcxDBTreeList;
    cxDBTL_MovingsTreeKOL_STAVOK: TcxDBTreeListColumn;
    cxDBTL_MovingsTreeOKLAD: TcxDBTreeListColumn;
    cxDBTL_MovingsTreeDATE_BEG: TcxDBTreeListColumn;
    cxDBTL_MovingsTreeDATE_END: TcxDBTreeListColumn;
    cxDBTL_MovingsTreeALL_NAME: TcxDBTreeListColumn;
    Label1: TLabel;
    Type_pers: TcxDBLabel;
    cxDBL_Sovmest: TcxDBLabel;
    cxDBTL_MovingsTreeIs_Main_Post: TcxDBTreeListColumn;
    cxCB_ShowOld: TcxCheckBox;
    cxDBLabel1: TcxDBLabel;
    SpeedButton1: TSpeedButton;
    cxCB_ByRmoving: TcxCheckBox;
    ActionList1: TActionList;
    BonusesAct: TAction;
    procedure MovingsViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SB_HolidayClick(Sender: TObject);
    procedure cxDBTL_MovingsTreeCustomDrawCell(Sender: TObject;
      ACanvas: TcxCanvas; AViewInfo: TcxTreeListEditCellViewInfo;
      var ADone: Boolean);
    procedure LoadFromRegistry;
    procedure SaveIntoRegistry;
    procedure FrameExit(Sender: TObject);
    procedure cxCB_ShowOldClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cxCB_ByRmovingPropertiesChange(Sender: TObject);
  private
    ActualDate: TDate;
    Select_Type: Integer;
  public
    DMod: TdmMovings;
    procedure MovingsSelectAfterOpen(DataSet: TDataSet);
    constructor Create(AOwner: TComponent; DM: TdmMovings; Id_PCard: Integer;
        ActualDate: TDate; Select_Type: Integer); reintroduce;
  end;

implementation

{$R *.dfm}

uses uMovingsRedact, uFormControl, Registry, uHolidayInfo, Clipbrd;

constructor TfmPCardMovingsPage.Create(AOwner: TComponent; DM: TdmMovings;
    Id_PCard: Integer; ActualDate: TDate; Select_Type: Integer);
var i,c:integer;

begin
    inherited Create(AOwner);

    Self.ActualDate := ActualDate;
    Self.Select_Type := Select_Type;
    DMod:=TdmMovings.Create(SELF);
    DMod:=DM;
    DMod.pFIBDS_Format.Open;

    DMod.MovingsSelect.AfterOpen:=MovingsSelectAfterOpen;

    if (not VarIsNull(DMod.pFIBDS_Format['stavki_disp_format']))
     then DMod.MovingsSelectKOL_STAVOK.DisplayFormat:=DMod.pFIBDS_Format['stavki_disp_format'];

    DMod.MovingsSelect.ParamByName('Id_PCard').AsInteger := Id_PCard;
    DMod.MovingsSelect.ParamByName('Act_date').AsDate := ActualDate;

    DMod.MovingsSelect.ParamByName('Select_Type').AsInteger := Select_Type;
    DMod.MovingsSelect.Open;
    DMod.MovingsSelect.Filter:=QuotedStr(DateToStr(ActualDate))+'< date_end';
//    DMod.MovingsSelect.Filter:='('+QuotedStr(DateToStr(ActualDate))+' < date_end)or(date_end is null)';

    cxDBL_Sovmest.DataBinding.DataSource:=DMod.MovingsSource;
    Type_pers.DataBinding.DataSource:=DMod.MovingsSource;
  //  Smeta.DataBinding.DataSource:=DMod.MovingsSource;
    Num_Ord.DataBinding.DataSource:=DMod.MovingsSource;
    Date_ord.DataBinding.DataSource:=DMod.MovingsSource;
    cxDBLabel1.DataBinding.DataSource:=DMod.MovingsSource;
    cxDBTL_MovingsTree.DataController.DataSource := DMod.MovingsSource;

    LoadFromRegistry;
    DMod.MovingsSelect.Filtered:=not cxCB_ShowOld.Checked;

{   c:=cxDBTL_MovingsTree.Nodes.Count-1;
    for i:=0 to c do
      if (VarIsNull(cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex]))
//         and
//         (( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex] <= ActualDate )
//          and
//          ( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_END.Position.ColIndex] >= ActualDate ))
       then cxDBTL_MovingsTree.Nodes.Items[i].Expand(False);}
end;

procedure TfmPCardMovingsPage.LoadFromRegistry;
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
      cxCB_ByRmoving.Checked := reg.ReadBool('by_rmoving');
			reg.CloseKey;
		end;
	except ;
	end;
	reg.Free;
end;

procedure TfmPCardMovingsPage.SaveIntoRegistry;
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
      reg.WriteBool('by_rmoving',cxCB_ByRmoving.Checked);
			reg.CloseKey;
		end;
	finally
		reg.Free;
	end;
end;

procedure TfmPCardMovingsPage.MovingsViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (( Key = VK_F12) and (ssShift in Shift)) then
   begin
     ShowInfo(cxDBTL_MovingsTree.DataController.DataSource.DataSet);
     if not VarIsNull(cxDBTL_MovingsTree.DataController.DataSource.DataSet['id_man_moving']) then
      ClipBoard.AsText:=cxDBTL_MovingsTree.DataController.DataSource.DataSet['id_man_moving'];
   end;
  if (Key = VK_F2) then
   SB_HolidayClick(Self);
end;

procedure TfmPCardMovingsPage.SB_HolidayClick(Sender: TObject);
var
  RForm: TMovingsRedact_Form;
begin
  if (DMod.MovingsSelect.IsEmpty) then
   begin
     Exit;
   end;

  RForm:=TMovingsRedact_Form.Create(self,DMod,fmModify,DMod.MovingsSelect['id_man_moving']);
  RForm.ShowModal;
  RForm.Free;
  DMod.MovingsSelect.Close;
  DMod.MovingsSelect.Open;
end;

procedure TfmPCardMovingsPage.cxDBTL_MovingsTreeCustomDrawCell(
  Sender: TObject; ACanvas: TcxCanvas;
  AViewInfo: TcxTreeListEditCellViewInfo; var ADone: Boolean);
begin
    if (not AViewInfo.Selected)and
       (not VarIsNull(AViewInfo.Node.Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex])) then
    if ( AViewInfo.Node.Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex] > ActualDate )
        or
       ( AViewInfo.Node.Values[cxDBTL_MovingsTreeDATE_END.Position.ColIndex] < ActualDate )
    then
    begin
        ACanvas.Brush.Color := clSilver;
    end;
end;

procedure TfmPCardMovingsPage.FrameExit(Sender: TObject);
begin
  SaveIntoRegistry;
end;

procedure TfmPCardMovingsPage.cxCB_ShowOldClick(Sender: TObject);
begin
  DMod.MovingsSelect.Filtered:=not cxCB_ShowOld.Checked;
end;

procedure TfmPCardMovingsPage.SpeedButton1Click(Sender: TObject);
var
  RForm: THolidayForm;
begin
  if (DMod.MovingsSelect.IsEmpty) then
   begin
     Exit;
   end;

  RForm:=THolidayForm.Create(self,DMod,DMod.MovingsSelect['id_man_moving']);
  RForm.ShowModal;
  RForm.Free;
end;

procedure TfmPCardMovingsPage.cxCB_ByRmovingPropertiesChange(
  Sender: TObject);
var i: Integer;
begin
DMod.MovingsSelect.Close;
if ( not cxCB_ByRmoving.Checked) then i:= 0
else i:=1;
DMod.MovingsSelect.ParamByName('Select_Type').AsInteger := i;
Dmod.MovingsSelect.Open;
end;

procedure TfmPCardMovingsPage.MovingsSelectAfterOpen(DataSet: TDataSet);
var c,i:integer;
begin
    c:=cxDBTL_MovingsTree.Nodes.Count-1;
    for i:=0 to c do
      if (VarIsNull(cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex]))
//         and
//         (( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_BEG.Position.ColIndex] <= ActualDate )
//          and
//          ( cxDBTL_MovingsTree.Nodes.Items[i].Values[cxDBTL_MovingsTreeDATE_END.Position.ColIndex] >= ActualDate ))
       then cxDBTL_MovingsTree.Nodes.Items[i].Expand(False);
end;

end.
