unit Proppiska_Builds;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxCheckBox, ImgList, StdCtrls,
  cxContainer, cxLabel, ExtCtrls, dxBar, dxBarExtItems, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid;

type
  TForm1 = class(TForm)
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1SELECT: TcxGridDBColumn;
    cxGrid1DBTableView1ID_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NUM_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1NAME_BUILD: TcxGridDBColumn;
    cxGrid1DBTableView1SHORT_NAME: TcxGridDBColumn;
    cxGrid1DBTableView1SIZE: TcxGridDBColumn;
    cxGrid1DBTableView1FLOORS: TcxGridDBColumn;
    cxGrid1DBTableView1CHIEF: TcxGridDBColumn;
    cxGrid1DBTableView1OBLAST: TcxGridDBColumn;
    cxGrid1DBTableView1RAION: TcxGridDBColumn;
    cxGrid1DBTableView1TOWN: TcxGridDBColumn;
    cxGrid1DBTableView1STREET: TcxGridDBColumn;
    cxGrid1DBTableView1HOUSE: TcxGridDBColumn;
    cxGrid1DBTableView1INDEX: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cxStyle3: TcxStyle;
    cxStyle4: TcxStyle;
    dxBarManager1: TdxBarManager;
    AddButton: TdxBarLargeButton;
    EditButton: TdxBarLargeButton;
    DeleteButton: TdxBarLargeButton;
    RefreshButton: TdxBarLargeButton;
    ExitButton: TdxBarLargeButton;
    SelectButton: TdxBarLargeButton;
    ViewButton: TdxBarLargeButton;
    Panel1: TPanel;
    cxLabel1: TcxLabel;
    cxLabel3: TcxLabel;
    ShortNameLabel: TEdit;
    AddressLabel: TEdit;
    LargeImages: TImageList;
    DisabledLargeImages: TImageList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
