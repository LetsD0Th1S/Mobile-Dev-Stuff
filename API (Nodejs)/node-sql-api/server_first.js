const tunnel = require('tunnel-ssh');

const sshConfig = {
  host: 'The_Drengr',         // Public IP/hostname of the SSH server
  port: 22,                           // SSH port (default is 22)
  username: 'julianproject',     // SSH username
  password: 'Sm0keT0Fly!@345', // Or privateKey: require('fs').readFileSync('<path>'),
  dstHost: 'Obie-Laptop',       // Private IP/hostname of the SQL Server
  dstPort: 1550,                      // SQL Server port (default is 1433)
  localHost: '127.0.0.1',             // Local address to bind to
  localPort: 1550                    // Local port for the tunnel
};

const sql = require('mssql');

function connectToSqlViaSsh() {
  return new Promise((resolve, reject) => {
    const server = tunnel(sshConfig, (err) => {
      if (err) {
        return reject(err);
      }
      // The tunnel is established. Now connect to the local port.
      const dbConfig = {
        user: 'jt',
        password: 'jtime',
        server: '127.0.0.1',          // Connect to the local forwarded port
        port: 1550,                   // Use the local port defined in sshConfig
        database: 'Demo_701_Testing',
        options: {
          encrypt: false,             // Encryption is handled by the SSH tunnel
          trustServerCertificate: true // Might be needed for some setups
        }
      };

      sql.connect(dbConfig).then(pool => {
        console.log('Connected to SQL Server via SSH tunnel');
        resolve(pool);
      }).catch(dbErr => {
        server.close(); // Close the tunnel on database connection error
        reject(dbErr);
      });
    });

    server.on('error', (err) => {
      reject(err);
    });
  });
}

connectToSqlViaSsh().then(pool => {
  // Use the pool for your application's database operations
  pool.request().query('SELECT * FROM your_table', (err, result) => {
    if (err) console.error(err);
    console.log(result.recordset);
  });
}).catch(err => {
  console.error('Connection failed:', err);
});