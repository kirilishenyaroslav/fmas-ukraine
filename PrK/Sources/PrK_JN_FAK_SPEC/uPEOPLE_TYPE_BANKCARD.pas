unit uPEOPLE_TYPE_BANKCARD;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uSpec_SpravOneLevel, cxGraphics, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, DB, cxDBData, dxBar,
  dxBarExtItems, FIBQuery, pFIBQuery, pFIBStoredProc, FIBDatabase,
  pFIBDatabase, FIBDataSet, pFIBDataSet, ImgList, ActnList, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxControls, cxGridCustomView, cxGrid, dxStatusBar, cxLookAndFeelPainters,
  StdCtrls, cxButtons, cxContainer, cxTextEdit, ExtCtrls;

type
  TFormPEOPLE_TYPE_BANKCARD = class(TFormSpec_SpravOneLevel)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPEOPLE_TYPE_BANKCARD: TFormPEOPLE_TYPE_BANKCARD;

implementation
uses uPrK_Resources,uConstants;

{$R *.dfm}

procedure TFormPEOPLE_TYPE_BANKCARD.FormCreate(Sender: TObject);
begin
  inherited;
{ID_NAME должен стоять первым так как в SelectSQLText может делаться CloseOpen}
  ID_NAME              :='ID_TYPE_BANKCARD';
  SelectSQLText        :='Select * from PEOPLE_TYPE_BANKCARD_SELECT';
  ShowNpp              := false;
  StoredProcAddName    :='PEOPLE_TYPE_BANKCARD_ADD';
  StoredProcChangeName :='PEOPLE_TYPE_BANKCARD_CHANGE';
  StoredProcDelName    :='PEOPLE_TYPE_BANKCARD_DEL';
//  NamePrKSpravEdit     := SpecSpravEditStandart;// возможно это не надо будет

  InicFormCaption      :='Довідник типів банківських карток';

  //CheckAccessAdd    :='';
  //CheckAccessChange :='';
  //CheckAccessDel    :='';
end;

end.
