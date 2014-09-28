unit UpReminderMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ExtCtrls, ComCtrls, cxMemo, cxCheckBox,
  cxLookAndFeelPainters, StdCtrls, cxButtons, cxGridBandedTableView,
  FIBQuery, pFIBQuery, FIBDatabase, pFIBDatabase, FIBDataSet,
  pFIBDataSet, IBase, pFIBStoredProc, cxContainer, cxTextEdit, cxMaskEdit,
  cxButtonEdit, cxDropDownEdit, cxCalendar, cxCurrencyEdit, Classes, dxBar,
  uCommonSp;

type
  TUP_Reminder = class(TSprav)
  public
   constructor Create;
   procedure   Show; override;
  end;

  TUpReminderForm = class(TForm)
    MainPanel: TPanel;
    PageControl: TPageControl;
    RepTabSheet: TTabSheet;
    StyleRepository: TcxStyleRepository;
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
    cxStyle17: TcxStyle;
    cxStyle18: TcxStyle;
    cxStyle19: TcxStyle;
    cxStyle20: TcxStyle;
    cxStyle21: TcxStyle;
    cxStyle22: TcxStyle;
    cxStyle23: TcxStyle;
    cxStyle24: TcxStyle;
    cxStyle25: TcxStyle;
    cxStyle26: TcxStyle;
    cxStyle27: TcxStyle;
    cxStyle28: TcxStyle;
    GridTableViewStyleSheet: TcxGridTableViewStyleSheet;
    GridBandedTableViewStyleSheet: TcxGridBandedTableViewStyleSheet;
    Database: TpFIBDatabase;
    DogDataSet: TpFIBDataSet;
    ReadTransaction: TpFIBTransaction;
    WriteTransaction: TpFIBTransaction;
    Query: TpFIBQuery;
    DogTableView: TcxGridDBTableView;
    DogGridLevel1: TcxGridLevel;
    DogGrid: TcxGrid;
    Label1: TLabel;
    TabSheet1: TTabSheet;
    Label2: TLabel;
    TabSheet2: TTabSheet;
    PrivateGrid: TcxGrid;
    PrivateTableView: TcxGridDBTableView;
    PrivateLevel: TcxGridLevel;
    Label3: TLabel;
    DogDataSource: TDataSource;
    BarManager: TdxBarManager;
    dockDogovor: TdxBarDockControl;
    btnDelDog: TdxBarButton;
    btnPostponeDog: TdxBarButton;
    btnRefreshDog: TdxBarButton;
    DogTableViewTN: TcxGridDBColumn;
    DogTableViewFIO: TcxGridDBColumn;
    DogTableViewNAME_DEPARTMENT: TcxGridDBColumn;
    DogTableViewNAME_POST: TcxGridDBColumn;
    DogTableViewACCEPT_DATE: TcxGridDBColumn;
    DogTableViewDATE_END: TcxGridDBColumn;
    dockBirthDay: TdxBarDockControl;
    btnDelBirth: TdxBarButton;
    btnPostponeBirth: TdxBarButton;
    btnRefreshBirth: TdxBarButton;
    BirthGrid: TcxGrid;
    BirthTableView: TcxGridDBTableView;
    BirthGridLevel: TcxGridLevel;
    BirthDataSet: TpFIBDataSet;
    BirthDataSource: TDataSource;
    BirthTableViewTN: TcxGridDBColumn;
    BirthTableViewFIO: TcxGridDBColumn;
    BirthTableViewNAME_DEPARTMENT: TcxGridDBColumn;
    BirthTableViewNAME_POST: TcxGridDBColumn;
    BirthTableViewBIRTH_DATE: TcxGridDBColumn;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnRefreshDogClick(Sender: TObject);
    procedure btnRefreshBirthClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SelectDogData;
    procedure SelectBirthData;
  end;

function CreateSprav: TSprav;stdcall;
exports  CreateSprav;

function ShowReminder(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; fs : TFormStyle) : boolean; stdcall;

exports  ShowReminder;

var
  UpReminderForm: TUpReminderForm;

implementation

uses Accmgmt;

{$R *.dfm}

function ShowReminder(AOwner : TComponent; DBHandle : TISC_DB_HANDLE; fs : TFormStyle) : boolean; stdcall;
var
 f : TUpReminderForm;
begin
 if fs = fsNormal then begin
  UpReminderForm := TUpReminderForm.Create(AOwner);

  UpReminderForm.Database.Handle := DBhandle;
  UpReminderForm.ReadTransaction.StartTransaction;

  UpReminderForm.FormStyle := fs;

//  GetFormParams(UpReminderForm);
  UpReminderForm.ShowModal;
//  SetFormParams(UpReminderForm);
 end
 else begin
  f := TUpReminderForm.Create(AOwner);

  f.Database.Handle := DBhandle;
  f.ReadTransaction.StartTransaction;

  f.FormStyle := fs;

//  GetFormParams(f);
  if fs = fsNormal then f.ShowModal
  else f.Show;
 end;

 Result := True;
end;

procedure TUpReminderForm.FormCreate(Sender: TObject);
begin
 PageControl.ActivePageIndex := 0;
end;

procedure TUpReminderForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
// if not (fsModal in FormState) then SetFormParams(Self);

 Action := caFree;
end;

procedure TUpReminderForm.FormShow(Sender: TObject);
begin
 SelectDogData;
end;

procedure TUpReminderForm.SelectDogData;
begin
 DogDataSet.Close;
 DogDataSet.ParamByName('ID_USER').AsInteger := Accmgmt.fibGetCurrentUserInfo.UserID;
 DogDataSet.Open;
end;

procedure TUpReminderForm.SelectBirthData;
begin
 BirthDataSet.Close;
 BirthDataSet.ParamByName('ID_USER').AsInteger := Accmgmt.fibGetCurrentUserInfo.UserID;
 BirthDataSet.Open;
end;

procedure TUpReminderForm.btnRefreshDogClick(Sender: TObject);
begin
 SelectDogData;
end;

procedure TUpReminderForm.btnRefreshBirthClick(Sender: TObject);
begin
 SelectBirthData;
end;

{ TUP_Reminder }

constructor TUP_Reminder.Create;
begin

end;

procedure TUP_Reminder.Show;
begin
  inherited;

end;

function CreateSprav: TSprav;stdcall;
begin
    Result := TUP_Reminder.Create;
end;

end.
