import React, { useEffect } from 'react';

const Discovery2 = ({ content }) => {
    useEffect(() => {
        // Dynamically add the GCP script
        const script = document.createElement('script');
        script.src = "https://cloud.google.com/ai/gen-app-builder/client?hl=pt_BR";
        script.async = true;
        document.body.appendChild(script);

        // Cleanup if component unmounts
        return () => {
            document.body.removeChild(script);
        };
    }, []);

    return (
        <div className="home-container">
            <div className="max-w-4xl mx-auto px-4">
                <br />
                <h1 className="text-3xl font-bold mb-4">{content?.title}</h1>
                <p>{content?.description}</p>
                <p>{content?.image}</p>
                <p>{content?.link}</p>

                {/* GCP Search Widget elements */}
                <div>
                    <gen-search-widget
                        configid="faadabe8-f17d-4a69-8f93-f0dac48512fd"
                        triggerid="searchWidgetTrigger">
                    </gen-search-widget>
                    <input
                        placeholder="Pesquise aqui"
                        id="searchWidgetTrigger"
                        className="border px-3 py-2 mt-4 w-full"
                    />
                </div>
            </div>
        </div>
    );
};

export default Discovery2;





// import React from 'react';

// const Discovery2 = ({ content }) => {
//     return (
//         <div className="home-container">
//             <div className="max-w-4xl mx-auto px-4">
//                 <br></br>
//                 <h1 className="text-3xl font-bold mb-4">{content?.title}</h1>
//                 <p>{content?.description}</p>
//                 <p>{content?.image}</p>
//                 <p>{content?.link}</p>
//             </div>
//         </div>
//     );
// };

// export default Discovery2;






// <!DOCTYPE html>
// <html lang="en">
// <head>
//     <meta charset="UTF-8">
//     <meta name="viewport" content="width=device-width, initial-scale=1.0">
//     <title>GCP Discovery Engine React App</title>
//     <script src="https://cdn.jsdelivr.net/npm/react@18.2.0/umd/react.production.min.js"></script>
//     <script src="https://cdn.jsdelivr.net/npm/react-dom@18.2.0/umd/react-dom.production.min.js"></script>
//     <script src="https://cdn.jsdelivr.net/npm/@babel/standalone@7.22.9/babel.min.js"></script>
//     <script src="https://cdn.tailwindcss.com"></script>
// </head>
// <body>
//     <div id="root"></div>
//     <script type="text/babel">
//         import React, { useState } from 'react';
//         import { createRoot } from 'react-dom/client';

//         const Discovery2 = ({ content }) => {
//             const [configId, setConfigId] = useState('');
//             const [apiStatus, setApiStatus] = useState('');

//             const handleConnect = async () => {
//                 if (!configId) {
//                     setApiStatus('Please enter a valid configId.');
//                     return;
//                 }

//                 setApiStatus('Connecting to GCP Discovery Engine...');
//                 try {
//                     // Placeholder for GCP Discovery Engine API call
//                     // Example using Google APIs JavaScript Client (gapi) or fetch
//                     // You need to initialize gapi.client or use fetch with proper authentication
//                     /*
//                     await gapi.client.discoveryengine.someMethod({
//                         configId: configId,
//                         // Other parameters
//                     });
//                     */
//                     // For demonstration, we'll simulate a successful connection
//                     setApiStatus(`Connected with configId: ${configId}`);
                    
//                     // Actual implementation would involve:
//                     // 1. Loading Google API Client: gapi.load('client', initClient);
//                     // 2. Initializing with API key or OAuth: gapi.client.init({ apiKey, clientId, scope });
//                     // 3. Making API call to Discovery Engine
//                     // Example (commented out as it requires setup):
//                     /*
//                     const response = await fetch(
//                         `https://discoveryengine.googleapis.com/v1/projects/YOUR_PROJECT/locations/global/collections/default_collection/dataStores/${configId}`,
//                         {
//                             headers: {
//                                 Authorization: `Bearer ${accessToken}`,
//                             },
//                         }
//                     );
//                     const data = await response.json();
//                     setApiStatus(`Connected: ${JSON.stringify(data)}`);
//                     */
//                 } catch (error) {
//                     setApiStatus(`Error: ${error.message}`);
//                 }
//             };

//             return (
//                 <div className="home-container min-h-screen bg-gray-100 py-8">
//                     <div className="max-w-4xl mx-auto px-4">
//                         <br />
//                         <h1 className="text-3xl font-bold mb-4">{content?.title}</h1>
//                         <p className="mb-4">{content?.description}</p>
//                         <p className="mb-4">{content?.image}</p>
//                         <p className="mb-4">{content?.link}</p>
                        
//                         <div className="mt-6">
//                             <label htmlFor="configId" className="block text-lg font-medium mb-2">
//                                 GCP Discovery Engine Config ID
//                             </label>
//                             <input
//                                 type="text"
//                                 id="configId"
//                                 value={configId}
//                                 onChange={(e) => setConfigId(e.target.value)}
//                                 placeholder="Enter configId (e.g., your-datastore-id)"
//                                 className="w-full p-2 border rounded-md mb-4 focus:outline-none focus:ring-2 focus:ring-blue-500"
//                             />
//                             <button
//                                 onClick={handleConnect}
//                                 className="bg-blue-500 text-white px-4 py-2 rounded-md hover:bg-blue-600 transition"
//                             >
//                                 Connect to Discovery Engine
//                             </button>
//                             {apiStatus && (
//                                 <p className="mt-4 text-sm text-gray-700">{apiStatus}</p>
//                             )}
//                         </div>
//                     </div>
//                 </div>
//             );
//         };

//         // Sample content for demonstration
//         const sampleContent = {
//             title: 'GCP Discovery Engine Integration',
//             description: 'Connect to the GCP Discovery Engine using a configId to enable advanced search and recommendation features.',
//             image: 'https://example.com/image.jpg',
//             link: 'https://cloud.google.com/discovery-engine',
//         };

//         // Render the component
//         const root = createRoot(document.getElementById('root'));
//         root.render(<Discovery2 content={sampleContent} />);
//     </script>
// </body>
// </html>