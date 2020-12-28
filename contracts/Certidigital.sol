// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;
pragma experimental ABIEncoderV2;


contract Certidigital {

    struct Certificado {
        address emisor;
        address receptor;
        string hashFile;
        string fechaEmision;
        string fechaExpiracion;
    }

    //id, certificado
    mapping(string => Certificado) certificados;

    event Certificar(address indexed _from, address indexed _to, Certificado _certificado);

    function crearCertificado(address receptor,
        string memory idCertificado,
        string memory hashFile,
        string memory fechaEmision,
        string memory fechaExpiracion)
    public payable returns (bool) {
        Certificado memory certificado = Certificado(msg.sender, receptor, hashFile, fechaEmision, fechaExpiracion);
        certificados[idCertificado] = certificado;
        emit Certificar(msg.sender, receptor, certificado);
        return true;
    }

    function eliminarCertificado(string memory idCertificado) public {
        delete certificados[idCertificado];
    }

    function getCertificado(string memory idCertificado) public view returns (Certificado memory){
        return certificados[idCertificado];
    }

}