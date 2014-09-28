unit USmetaGrSpr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxTextEdit, cxCheckBox, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin, ImgList,
  FIBDatabase, pFIBDatabase,Ibase;

type
  TfrmSmetaGroup = class(TForm)
    SmallImages: TImageList;
    cxStyleRepository1: TcxStyleRepository;
    back: TcxStyle;
    column_gray: TcxStyle;
    periods: TcxStyle;
    ToolBar1: TToolBar;
    AddButton: TToolButton;
    DelButton: TToolButton;
    UpdateButton: TToolButton;
    ToolButton14: TToolButton;
    CloseButton: TToolButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    WriteTransaction: TpFIBTransaction;
    WorkDatabase: TpFIBDatabase;
    ReadTransaction: TpFIBTransaction;
    procedure CloseButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    constructor Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer);overload;
  end;

function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer):Variant;stdcall;
exports GetSmGrp;

implementation

function GetSmGrp(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer):Variant;
var T:TfrmSmetaGroup;
begin
       if fs=fsNormal
       then begin
            T:=TfrmSmetaGroup.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION);
            T.ShowModal;
            T.Free;
       end
       else begin
            TfrmSmetaGroup.Create(AOwner,DB_HANDLE,FS,ID_FOR_LOCATION);
       end;
end;



{$R *.dfm}
constructor TfrmSmetaGroup.Create(AOwner:TComponent;DB_HANDLE:TISC_DB_HANDLE;FS:TFormStyle;ID_FOR_LOCATION:Integer);
begin
     inherited Create(Aowner);
     WorkDatabase.Handle:=DB_HANDLE;
end;

procedure TfrmSmetaGroup.CloseButtonClick(Sender: TObject);
begin
     Close;
end;

end.
